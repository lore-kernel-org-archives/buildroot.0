From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 5 Nov 2019 14:19:28 -0600
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with RELRO
In-Reply-To: <20191104231237.1954d080@windsurf.home>
References: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
 <20191031134302.685d1858@windsurf.home>
 <CAPi7W81G6kXj_ueiGDq2ocz_Q8HesGVDpp5g7BgXJ1qpqpu6WQ@mail.gmail.com>
 <20191104231237.1954d080@windsurf.home>
Message-ID: <CANQCQpYQN5siLJi80xqbqbW81wncZ9mPhSojwWqdc66hDhoaOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Nov 4, 2019 at 4:12 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I'm adding a few more people in Cc: Matt, Yann, Arnout, Peter.
>
> On Thu, 31 Oct 2019 14:01:33 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > What is the relationship between using precompiled headers and relro
> > > build problems ?
> > I took me some time to understand the issue.
> > It seems that linker flag such as -Wl,-z,relro should not be used when
> > building a precompiled header.
> > I discovered this through this domoticz commit message:
> > https://github.com/domoticz/domoticz/commit/68698e7a5dce80dea5a9b997d7e171b80bf566ac
> >
> > However, this commit does not fix the issue on buildroot as
> > -Wl,-z,relro is not passed through CXXFLAGS but through our
> > toolchain-wrapper.
> > Updating toolchain/toolchain-wrapper.c to add the logic to manage
> > precompiled header seems more complicated than adding an option to
> > disable this feature from domoticz.
>
> So, I looked into this, found
> https://lists.fedoraproject.org/pipermail/devel/2011-July/153664.html
> and https://bugzilla.redhat.com/show_bug.cgi?id=718719.
>
> So it really seems like -Wl,-z,relzo should not be passed when
> compiling. But our compiler wrapper passes it unconditionally when
> RELRO is enabled.
>
> Do we have a way to detect that the wrapper is called to compile or to
> link ? I don't think we do.

Looks like we can just key on -xc-header or -xc++-header and
selectively enable the RELRO flags.  I'll do some builds and then send
a patch if that looks ok.

https://pastebin.com/XGc8bFxh

Matt
