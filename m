From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 30 Mar 2019 00:24:18 -0300
Subject: [Buildroot] [PATCH 1/2] support/testing: add test to verify
 'scp' download via BR2_PRIMARY_SITE
References: <20190215213549.8476-1-patrickdepinguin@gmail.com>
Message-ID: <5c9ee16214b66_29f73fa56c0c2ac84317a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry the long delay.
Check the method name issue, some code that can removed and also some nits
below.

On Fri, Feb 15, 2019 at 07:35 PM, Thomas De Schampheleire wrote:

> Recently it was found that the scp download infrastructure was broken.
> To avoid future failures, create a test that verifies that the scp command
> receives the expected arguments.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  .../tests/download/br2-external/scp/Config.in |  0
>  .../download/br2-external/scp/external.desc   |  1 +
>  .../download/br2-external/scp/external.mk     |  1 +
>  .../br2-external/scp/package/nohash/nohash.mk | 10 +++
>  support/testing/tests/download/scp-wrapper    | 62 +++++++++++++++++++
>  support/testing/tests/download/test_scp.py    | 45 ++++++++++++++
>  6 files changed, 119 insertions(+)

After fixing the name of the test method below, please run
'make .gitlab-ci.yml'.

>  create mode 100644 support/testing/tests/download/br2-external/scp/Config.in
>  create mode 100644 support/testing/tests/download/br2-external/scp/external.desc
>  create mode 100644 support/testing/tests/download/br2-external/scp/external.mk
>  create mode 100644 support/testing/tests/download/br2-external/scp/package/nohash/nohash.mk
>  create mode 100755 support/testing/tests/download/scp-wrapper
>  create mode 100644 support/testing/tests/download/test_scp.py

Please run flake8 and fix the warnings it generates.
scp-wrapper:14:1: E302 expected 2 blank lines, found 1
scp-wrapper:59:1: E305 expected 2 blank lines after class or function definition, found 1
test_scp.py:4:1: E302 expected 2 blank lines, found 1
test_scp.py:12:9: E122 continuation line missing indentation or outdented
test_scp.py:40:33: E261 at least two spaces before inline comment

[snip]
> +++ b/support/testing/tests/download/test_scp.py
> @@ -0,0 +1,45 @@
> +import infra
> +import os
> +
> +class TestScpPrimarySite(infra.basetest.BRConfigTest):
> +    host = 'user at server.example.org'
> +    basepath = 'some/directory'
> +    scp_wrapper = infra.filepath("tests/download/scp-wrapper")
> +    br2_external = [infra.filepath("tests/download/br2-external/scp")]
> +

> +    def __init__(self, names):
> +        self.config = \
> +        """
> +        BR2_PRIMARY_SITE="scp://%s:%s"
> +        BR2_PRIMARY_SITE_ONLY=y
> +        BR2_BACKUP_SITE=""
> +        BR2_SCP="%s"
> +        """ % (self.host, self.basepath, self.scp_wrapper)
> +
> +        super(TestScpPrimarySite, self).__init__(names)

This is not really needed since the values are not dynamically set, so you can
just set in the class:

    config = \
        """
        BR2_PRIMARY_SITE="scp://%s:%s"
        BR2_PRIMARY_SITE_ONLY=y
        BR2_BACKUP_SITE=""
        BR2_SCP="%s"
        """ % (host, basepath, scp_wrapper)

> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +        if self.b and not self.keepbuilds:
> +            self.b.delete()

This method already exists in the parent class so it is not needed here.

> +
> +    def test_download(self):

Please use test_run here, otherwise 'make .gitlab-ci.yml' will not pickup this
test.

> +        package = 'nohash'
> +        # store downloaded tarball inside the output dir so the test infra
> +        # cleans it up at the end
> +        env = {
> +            "BR2_DL_DIR": os.path.join(self.builddir, "dl"),
> +            "SCP_WRAPPER_EXPECTED_HOST": self.host,
> +            "SCP_WRAPPER_EXPECTED_BASEPATH": self.basepath,
> +            "SCP_WRAPPER_EXPECTED_FILEPATH": '%s-123.tar.gz' % package

nit: .format() appear more often in the test infra then %
There are another occurrences in this patch.


Regards,
Ricardo
