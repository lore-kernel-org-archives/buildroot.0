From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 14 Oct 2019 08:44:38 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ws4py: add patch to fit
 Python 3.7 syntax
In-Reply-To: <5b972d9c-1b8c-5729-ead2-c2289532f733@mind.be>
References: <20191013141601.6662-1-asafka7@gmail.com>
 <5b972d9c-1b8c-5729-ead2-c2289532f733@mind.be>
Message-ID: <CALFsTFWcHWQuOaeS06PCcQ4sm4wCR7UhxWa1DOZg7YCm9dtNsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Oct 13, 2019 at 11:43 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 13/10/2019 16:16, Asaf Kahlon wrote:
> > Fixes:
> >  - http://autobuild.buildroot.net/results/2999d8de19ed7bf7a5ce148da4b1b98f144bad9b
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  ...1-Adjust-ws4py-for-Python-3.7-syntax.patch | 55 +++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644 package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
> >
> > diff --git a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
> > new file mode 100644
> > index 0000000000..07fbb6ccc1
> > --- /dev/null
> > +++ b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
> > @@ -0,0 +1,55 @@
> > +From dfe6f65b7078315c32cebb727e9c47ead7603475 Mon Sep 17 00:00:00 2001
> > +From: Asaf Kahlon <asafka7@gmail.com>
> > +Date: Sun, 13 Oct 2019 16:44:44 +0300
> > +Subject: [PATCH 1/1] Adjust ws4py for Python 3.7 syntax
> > +
> > +Since Python 3.7, "async" has become a keyword and cannot be used.
> > +Thus, instead of asyncio.async we will use asyncio.ensure_future.
> > +
> > +There's also a pull request with this change:
> > +https://github.com/Lawouach/WebSocket-for-Python/pull/245
>
>  So why don't you use the commit from that PR? It looks more complete because it
> also fixes a test (not really relevant for us, obviously, but we prefer upstream
> commits or PRs...)

Actually, I tried that, but then I realized that the patch won't apply
since the test file is not included on the tarball.

>
> > +
> > +Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>
>  You would still need your SoB to it of course.
>

It probably doesn't matter, but the guy doesn't have his own SoB on the PR...

Anyway, it seems like the original patch can't be taken as-is.
Maybe I should amend the commit message to make it clear why a custom
patch is needed?

>  Regards,
>  Arnout
>
> > +---
> > + ws4py/async_websocket.py    | 4 ++--
> > + ws4py/server/tulipserver.py | 2 +-
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/ws4py/async_websocket.py b/ws4py/async_websocket.py
> > +index 9e2a4c7..ea296b4 100644
> > +--- a/ws4py/async_websocket.py
> > ++++ b/ws4py/async_websocket.py
> > +@@ -84,7 +84,7 @@ class WebSocket(_WebSocket):
> > +         def closeit():
> > +             yield from self.proto.writer.drain()
> > +             self.proto.writer.close()
> > +-        asyncio.async(closeit())
> > ++        asyncio.ensure_future(closeit())
> > +
> > +     def _write(self, data):
> > +         """
> > +@@ -94,7 +94,7 @@ class WebSocket(_WebSocket):
> > +         def sendit(data):
> > +             self.proto.writer.write(data)
> > +             yield from self.proto.writer.drain()
> > +-        asyncio.async(sendit(data))
> > ++        asyncio.ensure_future(sendit(data))
> > +
> > +     @asyncio.coroutine
> > +     def run(self):
> > +diff --git a/ws4py/server/tulipserver.py b/ws4py/server/tulipserver.py
> > +index 2786c16..85312a2 100644
> > +--- a/ws4py/server/tulipserver.py
> > ++++ b/ws4py/server/tulipserver.py
> > +@@ -40,7 +40,7 @@ class WebSocketProtocol(asyncio.StreamReaderProtocol):
> > +         #self.stream.set_transport(transport)
> > +         asyncio.StreamReaderProtocol.connection_made(self, transport)
> > +         # Let make it concurrent for others to tag along
> > +-        f = asyncio.async(self.handle_initial_handshake())
> > ++        f = asyncio.ensure_future(self.handle_initial_handshake())
> > +         f.add_done_callback(self.terminated)
> > +
> > +     @property
> > +--
> > +2.20.1
> > +
> >

Regards,
Asaf.
