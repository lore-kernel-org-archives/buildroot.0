From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 22:25:56 +0100
Subject: [Buildroot] [next] support/testing: new opkg test case
In-Reply-To: <20191126065746.39951-1-matthew.weber@rockwellcollins.com>
References: <20191126065746.39951-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200203222556.6bea81d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Nov 2019 00:57:46 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> - Validates an archive can be installed and removed
> - Builds an archives that uses postinst and prerm scripts
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  DEVELOPERS                                    |  1 +
>  support/testing/tests/package/test_opkg.py    | 63 +++++++++++++++++++
>  .../tests/package/test_opkg/post-build.sh     | 47 ++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 support/testing/tests/package/test_opkg.py
>  create mode 100755 support/testing/tests/package/test_opkg/post-build.sh

I've applied, with a few changes. See below.
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 544e3ac1c3..541029ab0e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1625,6 +1625,7 @@ F:	package/wireless_tools/
>  F:	package/xen/
>  F:	support/testing/tests/package/br2-external/openjdk/
>  F:	support/testing/tests/package/test_openjdk.py
> +F:	support/testing/tests/package/test_opkg.py

I've added the test_opkg/ folder as well here.

> +        # If successful, the prerm script ran to stop the service prior to
> +        # the removal of the service scripting and files
> +        cmd = "opkg remove example-snmpd-package"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +        # Verify after package removal that the services is not running
> +        cmd = "ps aux | grep [s]nmpd"

Here a sleep 1 was needed before the ps, because a stray [snmpd]
process stays for a short period of time. I was able to see it even by
testing manually.

> diff --git a/support/testing/tests/package/test_opkg/post-build.sh b/support/testing/tests/package/test_opkg/post-build.sh
> new file mode 100755
> index 0000000000..1b85aa002a
> --- /dev/null
> +++ b/support/testing/tests/package/test_opkg/post-build.sh
> @@ -0,0 +1,47 @@
> +#!/usr/bin/env bash
> +
> +IPK_BUILD=${TARGET_DIR}/root/ipk-build

I changed this to:

IPK_BUILD=${BUILD_DIR}/ipk-build

Because it feels weird to do all of this stuff in ${TARGET_DIR}.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
