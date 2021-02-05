From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Feb 2021 19:35:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-02-04
In-Reply-To: <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
 (Heiko Thiery's message of "Fri, 5 Feb 2021 15:42:46 +0100")
References: <601cff45.1c69fb81.945af.db28SMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
Message-ID: <87lfc27474.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

Hi,

 >> mipsel    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/da0e36543cf68e4e9bbe819945a884193f33819a

 > I checked the reason for the build failure on the netopeer2 package.
 > It is caused by some files that are created in /dev/shm/sr_* during
 > the installation process.

 > I tried to find a solution for that. My first intention was to do a
 > PRE_INSTALL_HOOK that deletes these files before the installation. But
 > YANN disclaimed that because we should never delete files in
 > /dev/shm/. This could lead to failures when doing concurrent parallel
 > builds.

 > To be more detailed what is going on:
 > The netopeer2 package can install the required yang models for runtime
 > during installation. Therefore an additional script (setup.sh) is
 > invoked. There the sysrepocfg host tool is used to do the installation
 > of these yang models. sysrepo will then create this /dev/shm files and
 > leave them. But with the updated netopeer2 package the shm files are
 > incompatible and the build errors appear.

 > So I see here 3 possible solutions:
 > 1. do the PRE_INSTALL_HOOK to remove the files every time (disclaimed by Yann).
 > 2. remove this files by hand (no long term solution).
 > 3. disable the installation of the yang modules .. but then we have a
 > non functional installation available and we leave the installation of
 > the yang modules to the user.

Ideally the package should be fixed to create those files in
$DESTDIR/dev/shm rather than mess around with the host /dev/shm.

But as /dev/shm is not persistent, how does this work at runtime? What
do those files do exactly?

-- 
Bye, Peter Korsgaard
