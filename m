From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 15:33:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: add --delete to
 rsync
In-Reply-To: <CAM+bi4tggsVGy7w9eRKRF_zy_o2dFU7CEJu6nx2Nv1=vVrVtig@mail.gmail.com>
References: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
 <20141010123659.187fd60d@free-electrons.com>
 <CAM+bi4tggsVGy7w9eRKRF_zy_o2dFU7CEJu6nx2Nv1=vVrVtig@mail.gmail.com>
Message-ID: <20141010153342.2794ef55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro Gamez,

On Fri, 10 Oct 2014 12:45:59 +0200, Alvaro Gamez wrote:

> You would like for the object files to remain there in case nothing or
> little has changed and its compilation can be omitted by the build
> tool (make or whatever).

Absolutely. That's the whole point of the OVERRIDE_SRCDIR mechanism:
you make a change in your external source directory, you run "make
<pkg>-rebuild", and it triggers a rsync of the source and then starts
rebuilding. But it should not rebuild from scratch, only rebuild the
source files that have changed.

> But it is my understanding that the main idea is to make $(@D) a copy
> of the source to do the build there.
> I've faced a problem in the case of a build that basically does gcc *.c -o out.
> In this situation, if I remove one .c file on the source directory,
> this doesn't get removed from $(@D) and the next time I invoke
> package-rebuild this removed file is still compiled, even though it
> doesn't exist now on the source.

Yes, I understand the issue. However, a quick test seems to suggest
that rsync --delete will also remove object files, which kind of
defeats the purpose of OVERRIDE_SRCDIR.

Not sure how to distinguish files that should be removed from files
that should be kept...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
