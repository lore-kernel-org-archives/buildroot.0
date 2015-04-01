From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:08:01 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/download: be more aggressive
 on missing hashes (branch yem/dl-hash-2)
In-Reply-To: <cover.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <20150401220801.19f6ed2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  1 Apr 2015 00:15:03 +0200, Yann E. MORIN wrote:
> Hello All!
> 
> This series makes hashes mandatory when a .hash file exists.
> 
> Currently, we treat missing hashes as a mere warning. Unfortunately,
> that often goes un-noticed by most users, and thus we get a lot of
> package bumps that are missing the new hashes corresponding to the new
> version.
> 
> We now make that a hard error, so users really notice something is
> wrong.
> 
> Of course, if no .hash file exists, the behaviour is as yet unchanged.

I applied this and was going to push it, but I believe there's still a
problem.

If I change strace.hash so that there is no hash matching the tarball
name of strace, then I get two times the error:

$ make strace-extract
ERROR: No hash found for strace-4.10.tar.xz
ERROR: No hash found for strace-4.10.tar.xz
package/pkg-generic.mk:73: recipe for target '/home/thomas/projets/buildroot/output/build/strace-4.10/.stamp_downloaded' failed

I haven't looked too deeply, but I believe it's because check-hash
returns 3, so dl-wrapper exits with error code 1, which means that the
pkg-download.mk logic concludes that the download from the upstream
location has failed, so it retries with sources.buildroot.net, and the
same thing happens.

Is this expected?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
