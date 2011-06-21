From: Allan Nielsen <a@awn.dk>
Date: Tue, 21 Jun 2011 10:29:47 +0200
Subject: [Buildroot] Trying to understand the Makefiles behind buildroot
Message-ID: <BANLkTinLw5yn=g0UdR6PVWD5JAQ=U-OXMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am trying to make some small changes to the buildroot make files to
make them fir better in my work flow. Currently I have 4 custom
projects which I am developing on, and I am using build root to build
them. As this is in the early steps of the development process, the
code-build-test cycle are quite short, and it is therefor not
practical to prepare a release of each package in each iteration.
Therefor I have created a new download method called githead, which
creates a regular git checkout directly in the build folder, allowing
me to do the development directly in the output/build/PGK-name folder.
This work fine, I implement a new feature, delete the stamp files:
.stamp_built, .stamp_staging_installed and .stamp_target_installed,
run make again and test the new features.

But what I do not understand is, why is it necessary to delete the
.stamp_staging_installed and .stamp_target_installed files, they
should be depended on .stamp_built (Makefile.package.in line 451-472)?

Also why is the depended projects not being rebuild?

Following is a snippit of the output produced by the command: "make
--debug=basic -R -r <target>" after I deleted only the build-stamp
file


                        Must remake target `libsubject-configure'.
                        Successfully remade target file `libsubject-configure'.
                         File
`/home/awn/git/buildroot4/output/build/libsubject-HEAD/.stamp_built'
does not exist.
                        Must remake target
`/home/awn/git/buildroot4/output/build/libsubject-HEAD/.stamp_built'.
Invoking recipe from package/Makefile.package.in:295 to update target
`/home/awn/git/buildroot4/output/build/libsubject-HEAD/.stamp_built'.
echo ">>> libsubject HEAD "Building""
PATH="/home/awn/git/buildroot4/output/host/bin:/home/awn/git/buildroot4/output/host/usr/bin:/home/awn/git/buildroot4/output/host/usr/sbin/:/opt/intel/vtune_amplifier_xe_2011/bin64:/opt/intel/composerxe-2011.4.191/bin/intel64:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.4.5:/opt/intel/fce/10.0.026/bin:/usr/games/bin:/opt/intel/composerxe-2011.4.191/mpirt/bin/intel64"
PERLLIB="/home/awn/git/buildroot4/output/host/usr/lib/perl"
/usr/bin/make -j12  -C
/home/awn/git/buildroot4/output/build/libsubject-HEAD//.buildroot_build_dir
touch /home/awn/git/buildroot4/output/build/libsubject-HEAD/.stamp_built
                        Successfully remade target file
`/home/awn/git/buildroot4/output/build/libsubject-HEAD/.stamp_built'.
                      Must remake target `libsubject-build'.
                      Successfully remade target file `libsubject-build'.
                    Must remake target `libsubject-install-staging'.
                    Successfully remade target file
`libsubject-install-staging'.
                     File `libsubject-install-target' does not exist.
                    Must remake target `libsubject-install-target'.
                    Successfully remade target file `libsubject-install-target'.
                  Must remake target `libsubject-install'.
                  Successfully remade target file `libsubject-install'.
                Must remake target `libsubject'.
                Successfully remade target file `libsubject'.
              Must remake target `gmbinit-depends'.
              Successfully remade target file `gmbinit-depends'.

As shown above, the project is being rebuild, but not reinstalled.

I do realize that this is properly not how buildroot is intended to be
used, but it would be very useful for developers which would like to
use buildroot for their primary build environment.

So, could someone please give me some pointers on how to change this behavioral.

Best regards
Allan W. Nielsen
