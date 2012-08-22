From: Will Newton <will.newton@gmail.com>
Date: Wed, 22 Aug 2012 14:00:04 +0100
Subject: [Buildroot] [PATCH] erlang: Add new package.
In-Reply-To: <20120817193340.39e7ddb5@skate>
References: <CAFbHwiTCXTT23fGLnz_w8kr+6NmNzV9kK+=nHYpXOY5NOMt1dg@mail.gmail.com>
 <20120817193340.39e7ddb5@skate>
Message-ID: <CAFbHwiS3mbxWCdAtWfNe995Bm3wSb0B+NztV_CpT82Wy-CJr=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 17, 2012 at 6:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Will,
>
> Le Wed, 4 Apr 2012 17:49:07 +0100,
> Will Newton <will.newton@gmail.com> a ?crit :
>
>> ---
>>  package/Config.in                     |    1 +
>>  package/erlang/Config.in              |    9 +++++++++
>>  package/erlang/erlang-build-fix.patch |   13 +++++++++++++
>>  package/erlang/erlang.mk              |   26 ++++++++++++++++++++++++++
>>  4 files changed, 49 insertions(+), 0 deletions(-)
>>  create mode 100644 package/erlang/Config.in
>>  create mode 100644 package/erlang/erlang-build-fix.patch
>>  create mode 100644 package/erlang/erlang.mk
>
> Thanks for this.
>
> A couple of questions/comments:
>
>  *) Could you update the patch to use autotools-package and
>  host-autotools-package in accordance with the latest package
>  infrastructure changes?

Ok, done.

>  *) Could you add your Signed-off by line?

Sure.

>  *) The complete Erlang stuff gets installed in /usr/lib/erlang, even
>  the binaries (compiler, interpreter?) in /usr/lib/erlang/bin/. Is this
>  the normal installation location? If so, then we should at least
>  probably provide a few symlinks from /usr/bin/.

I get these symlinks in my build, e.g.:

[wnewton at wnewton-linux buildroot]$ ls -l output/target/usr/bin/erl*
lrwxrwxrwx. 1 wnewton ldapusers 21 Aug 22 11:18
output/target/usr/bin/erl -> ../lib/erlang/bin/erl
lrwxrwxrwx. 1 wnewton ldapusers 22 Aug 22 11:18
output/target/usr/bin/erlc -> ../lib/erlang/bin/erlc

>  *) By default the /usr/lib/erlang/ size is 55 MB on ARM. Is this the
>  minimal size of the standard library?

It is quite large unfortunately. At least part of this seems to be
that the bytecode files (.beam) are not very compact. It is possible
to delete packages (just delete
/usr/lib/erlang/lib/<package>-<version>) but it is not clear exactly
what a good minimal set is. I remove gs (tk based UI) and wx
(wxWidgets based UI) libs as they are not supported by buildroot.

I'll add a config option for the megaco application which is the
largest by some distance.

>  *) From the configure.in script, I see options like shared-zlib, or
>  ssl path or things like that, but your erlang package does not depend
>  on zlib nor OpenSSL. Can you give a few comments about this?

I've added support for enabling openssl, zlib and ncurses dependencies.

I'll repost the patch with these changes.
