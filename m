From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 08:47:43 +0200
Subject: [Buildroot] [PATCH] gpsd: fix qt build problem
In-Reply-To: <CAHt8ZCP8C7qiaSR7OhdYHUoEK2uF7cLQ=WUraa-aqkzJvfpiBg@mail.gmail.com>
References: <1343161749-23289-1-git-send-email-spdawson@gmail.com>
 <20120724230041.29d9502f@skate>
 <CAHt8ZCP8C7qiaSR7OhdYHUoEK2uF7cLQ=WUraa-aqkzJvfpiBg@mail.gmail.com>
Message-ID: <20120725084743.1f624a9a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 07:42:58 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> On 24 July 2012 22:00, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > I'm sorry but no, this is not the right way of fixing it. The QtCore
> > and QtNetwork header paths are already on the build command line. It's
> > just that they are wrong because they have two times the sysroot
> > location:
> 
> Yes, agreed. Thanks for the feedback. (I see that you have now
> submitted patches to fix this properly.)

Well, in fact the problem was not in the arguments passed to scons, but
in the .pc files installed by Qt. They contained the full sysroot
location, while they are not supposed to, so when our special
pkg-config prefixed the locations coming from Qt .pc files by the
sysroot again, we had a wrong path.

I wish I didn't had to do this horrible SED'ing of Qt .pc files after
their installation, but unfortunately, the Qt build system handling of
paths is non-standard and it's really not trivial to get something that
builds, installs in the right place, and has the right prefix.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
