From: Christian Stewart <christian@paral.in>
Date: Tue, 19 Dec 2017 15:26:53 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org>
Message-ID: <87lghy2taa.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar, all,

Waldemar Brodkorb <wbx@openadk.org> writes:
> can you make the last failing link command more verbose?
> CCLD should be expanded to the full command used.

I'm still seeing this error under Gentoo against 2017.11:

>>> systemd 234 Building

PATH="/buildroot/host/bin:/buildroot/host/sbin:/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0:/usr/local/bin:/usr/bin:/bin:/opt/bin:/opt/golang/bin  /usr/bin/make -j5  -C /buildroot/build/systemd-234/     
Making all in .
  CCLD     libnss_systemd.la
  CCLD     libnss_myhostname.la
  CCLD     systemd-cgtop
  CCLD     systemd-cgls
  CCLD     systemd-nspawn
  CCLD     systemd-detect-virt
  CCLD     systemd-delta
  CCLD     systemd-analyze
  CCLD     systemd-run
  CCLD     systemd-mount
  CCLD     systemd-stdio-bridge
  CCLD     systemd-path
  CCLD     busctl
  CCLD     systemd-socket-activate
/lib/libpam.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

I believe on Gentoo some sort of environment leakage is breaking the lib path.

defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y


This has been an issue for quite some time, and the reason why I have
not upgraded past the early 2017 release. I finally upgraded to 2017.11
and have found that it's once again broken compilations on my machine.

I'm not sure how to get Buildroot to produce a more verbose CCLD output,
I have tried "make VERBOSE=1" but this doesn't give me more than shown above.

I previously bisected the issue down to commit 400eaa3452 if that helps.

That commit bumped the linux headers (I believe) from 4.9.9 to 4.10.0.

Best,
Christian Stewart
