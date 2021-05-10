From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Mon, 10 May 2021 14:56:24 +0200
Subject: [Buildroot] Build failure on acmesystems_acqua_a5_{256,512}mb
Message-ID: <6347f09d-5329-865a-f77d-92332050495d@grenoble.cnrs.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

In the autobuild results from 2021-05-06, I noticed the following
failures:

-- 8< --
                   defconfig |                        link to the job                        | orph?
-----------------------------+---------------------------------------------------------------+------
  acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157423  | ORPH 
  acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157424  | ORPH
-- 8< --

Since I am the original submitter of these two defconfigs, I feel
somewhat responsible for their fate. I then tried to troubleshoot the
problem, but unfortunately I am@a loss, so I hope someone here will
be able to provide some assistance.

Below are the results of my (probably faulty) investigations.

Following the link to the first failed job, I found what I believe is
the relevant error message. While building linux 5.4.107:

-- 8< --
  HOSTCC  scripts/extract-cert
scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>
                         ^
compilation terminated.
-- 8< --

What follows in the build log is mostly recursive make recursively
complaining.

My understanding is that this was compiling a helper program meant to
run on the host. On my desktop, <openssl/bio.h> is provided by
libssl-dev, which I have installed long ago, and that would explain why
the build works for me. Apparently, the autobuilder did not have that
package, and I failed to require it in the defconfig. So far so good.

Now, my first problem is: I cannot find a host openssl package in
buildroot. And the buildroot documentation does not list this within the
system requirements. So my question is: where is <openssl/bio.h>
supposed to come from?

Then, while browsing the kernel docs, I stumbled on this:

    You will also need openssl development packages
    to build kernels 4.3 and higher.

But then, how come not every board defconfig using linux ? 4.3 is
failing? I found a few other defconfigs that use linux-5.4, do not
require any host package other than the ones I require here, and do not
seem to fail.

Any help would be appreciated, as I am feeling completely clueless.

Regards,

Edgar Bonet.
