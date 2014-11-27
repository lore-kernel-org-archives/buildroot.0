From: Michael Wei <mwei@cs.ucsd.edu>
Date: Thu, 27 Nov 2014 00:08:02 -0800
Subject: [Buildroot] [PATCH 1/1] Fix npm module cross compilation,
 use up-to-date npm and install modules globally
In-Reply-To: <20141126224239.248beb17@free-electrons.com>
References: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
 <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
 <20141126224239.248beb17@free-electrons.com>
Message-ID: <CAE=9ZyMkQi9g=Addnkts6u8JKib0JPK46GXKaFzVNV8Ydesfcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, been busy:

Yes, it does ask npm to update itself first. Perhaps we should make that
the default, or some option? I'll look into moving it into
HOST_NODEJS_INSTALL_CMDS.

From the npm page:

   1. globally ?- This drops modules in {prefix}/lib/node_modules, and puts
   executable files in{prefix}/bin, where {prefix} is usually something
   like /usr/local. It also installs man pages in{prefix}/share/man, if
   they?re supplied.

So before, executables and manpages weren't being installed. So for
example, serialport installs the following, typically:

/home/mwei/devel/buildroot/output/target/usr/bin/serialportlist ->
/home/mwei/devel/buildroot/output/target/usr/lib/node_modules/serialport/bin/serialportList.js
/home/mwei/devel/buildroot/output/target/usr/bin/serialportterm ->
/home/mwei/devel/buildroot/output/target/usr/lib/node_modules/serialport/bin/serialportTerminal.js

Without -g, those utilities don't get installed. This is more of an issue
for npm modules that you run from the commandline rather than code.
typescript, pm2, gulp, and bunyan are some examples.

On Wed, Nov 26, 2014 at 1:42 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Michael Wei,
>
> On Sun, 23 Nov 2014 12:39:38 -0800, Michael Wei wrote:
>
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index 312aaa9..fbcb730 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -110,11 +110,13 @@ define NODEJS_INSTALL_MODULES
> >       # npm install call below and setting npm_config_rollback=false can
> both
> >       # help in diagnosing the problem.
> >       (cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
> > +             $(HOST_DIR)/usr/bin/npm install -g npm
> --prefix=$(HOST_DIR) && \
>
> If I understand correctly, this asks npm to update itself, i.e update
> the host npm. If that's the case, then I believe this should rather go
> in the HOST_NODEJS_INSTALL_CMDS.
>
> Also, could you explain what the "-g" option changes? I understand it
> installs modules "globally", but what means "globally" compared to what
> was done before? Sorry for the silly questions, but I'm far from being
> a NodeJS guy, so I don't really know how npm works.
>
> Thanks a lot,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
*Michael Wei*
Graduate Researcher
PhD Student
Non-Volatile Systems Laboratory @ UCSD
http://cseweb.ucsd.edu/users/m3wei/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141127/7b017854/attachment-0001.html>
