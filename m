From: Christian Stewart <christian@paral.in>
Date: Tue, 26 Dec 2017 13:50:38 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <20171225151337.GC27558@waldemar-brodkorb.de>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org> <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org> <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de> <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de>
Message-ID: <87mv25cg5t.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Waldemar Brodkorb <wbx@openadk.org> writes:
>> There are no extra pam files in my Buildroot tree - before building I
>> ensure this with a "git clean -xfd" and I've searched the tree as well.
>
> But that is strange then.
> find . -name libpam_misc.so\*
> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0
> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so
> ./output/build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0.82.1

... please note that I am building out of tree. There are no
limpam_misc* inside the "buildroot tree" which includes the main source
tree. When the compilation fails, inside my "output tree":

  $ find -name "libpam_misc.so*"
  ./build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so
  ./build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0
  ./build/linux-pam-1.3.0/libpam_misc/.libs/libpam_misc.so.0.82.1
  ./target/usr/lib/libpam_misc.so
  ./target/usr/lib/libpam_misc.so.0
  ./target/usr/lib/libpam_misc.so.0.82.1
  ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpam_misc.so
  ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpam_misc.so.0
  ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpam_misc.so.0.82.1

> Systemd wants to find libpam, if it is not there it seems to
> fallback to your native libpam.

Clearly, then, it is not finding the "./target/usr/lib/libpam_misc.so"
in "out-of-tree" build.

> You should always run "make clean && make" if you make any
> changes to your .config.

...I do...

Best,
Christian
