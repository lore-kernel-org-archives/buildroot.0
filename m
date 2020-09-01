From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Sep 2020 21:36:30 +0200
Subject: [Buildroot] [PATCH] support/runttime-tests: fix openssh test
In-Reply-To: <20200901071903.2179-1-yann.morin.1998@free.fr>
References: <20200901071903.2179-1-yann.morin.1998@free.fr>
Message-ID: <b3232023-b402-be65-aa24-c3f3fa39e1e8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/09/2020 09:19, Yann E. MORIN wrote:
> When it was applied, commit 243d500f8d3 (support/testing: add openssh
> runtime test) was amended to not provide a NIC to the emulated machine,
> as the test did not requier access to the outter world: it only uses the
> lo interface. Also, there was a discrepancy between the NIC name in the
> Buildroot configuration, and the drivers available in our default kernel
> image, making the boot hang for a while whaiting for a NIC that would
> never come.
> 
> However, that tweak was tested locally with a qmeu version more recent
> than the one available in our buidroot/base Docker image. As a
> consequence, that test fails to run in gitlab-ci.
> 
> Revert to using the old way of specifying no network: it works on
> gitlab-ci, and qemu versions in standard distros still support it.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  support/testing/tests/package/test_openssh.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
> index 6f981d42ca..2ae5030d5d 100644
> --- a/support/testing/tests/package/test_openssh.py
> +++ b/support/testing/tests/package/test_openssh.py
> @@ -21,7 +21,7 @@ class TestOpensshBase(infra.basetest.BRTest):
>          self.emulator.boot(arch="armv5",
>                             kernel="builtin",
>                             options=["-initrd", img,
> -                                    "-nic", "none"])
> +                                    "-net", "none"])
>          self.emulator.login(self.passwd)
>  
>          cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
> 
