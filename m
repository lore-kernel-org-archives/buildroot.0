From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Mar 2017 09:26:01 +0100
Subject: [Buildroot] [PATCH v3 4/5] support/testing: add package tests
In-Reply-To: <1490042214-6762-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWnfh2s1yiXGmkte4q-KYbEdzXimn69d1spqrZM7eJ8WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 20, 2017 at 9:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit adds some basic tests for two Buildroot packages: python and
> dropbear. These tests are by no mean meant to be exhaustive, but mainly
> to serve as initial examples for other tests.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/tests/package/__init__.py      |  0
>  support/testing/tests/package/test_dropbear.py | 28 +++++++++++++++++++++
>  support/testing/tests/package/test_python.py   | 35 ++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 support/testing/tests/package/__init__.py
>  create mode 100644 support/testing/tests/package/test_dropbear.py
>  create mode 100644 support/testing/tests/package/test_python.py
>
> diff --git a/support/testing/tests/package/__init__.py b/support/testing/tests/package/__init__.py
> new file mode 100644
> index 0000000..e69de29
> diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
> new file mode 100644
> index 0000000..a64b782
> --- /dev/null
> +++ b/support/testing/tests/package/test_dropbear.py
> @@ -0,0 +1,28 @@
> +import os
> +
> +import infra.basetest
> +
> +class TestDropbear(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +"""
> +BR2_TARGET_GENERIC_ROOT_PASSWD="testpwd"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", img,
> +                                    "-net", "nic",
> +                                    "-net", "user,hostfwd=tcp::2222-:22"])
> +        self.emulator.login("testpwd")
> +        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        # Would be useful to try to login through SSH here, through
> +        # localhost:2222, though it is not easy to pass the ssh
> +        # password on the command line.

This can be done using the paramiko python module, basically:

            import paramiko
            client = paramiko.SSHClient()
            client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            client.connect(host, username=user, password=pass)

If you insist on shell commands, you can use the tool 'sshpass' for it.

/Thomas
