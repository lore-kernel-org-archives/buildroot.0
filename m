From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 21:44:55 +0100
Subject: [Buildroot] [PATCH 1/1] support/testing: add test for
 python-avro
In-Reply-To: <20191229202912.23783-1-titouan.christophe@railnova.eu>
References: <20191229202912.23783-1-titouan.christophe@railnova.eu>
Message-ID: <20191229204455.GD26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2019-12-29 21:29 +0100, Titouan Christophe spake thusly:
> This adds a test case for python-avro, with a script that
> performs a simple deserialization.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Thanks for the quick follow-up and for the very descriptive test-case.
Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../tests/package/sample_python_avro.py       | 23 +++++++++++++++++++
>  .../testing/tests/package/test_python_avro.py | 11 +++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_avro.py
>  create mode 100644 support/testing/tests/package/test_python_avro.py
> 
> diff --git a/support/testing/tests/package/sample_python_avro.py b/support/testing/tests/package/sample_python_avro.py
> new file mode 100644
> index 0000000000..79d2dcdb22
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_avro.py
> @@ -0,0 +1,23 @@
> +from io import BytesIO
> +from avro.schema import Parse
> +from avro.io import DatumReader, BinaryDecoder
> +
> +schema = Parse("""{
> +"namespace": "org.buildroot.package.python_avro",
> +"type": "record",
> +"name": "Developer",
> +"fields": [
> +    {"name": "email", "type": "string"},
> +    {"name": "maintainer_of", "type": "string"}
> +]
> +}""")
> +
> +example = b'<titouan.christophe@railnova.eu\x16python_avro'
> +
> +reader = DatumReader(schema)
> +deserialized = reader.read(BinaryDecoder(BytesIO(example)))
> +
> +assert deserialized == {
> +    'email': 'titouan.christophe at railnova.eu',
> +    'maintainer_of': 'python_avro',
> +}
> diff --git a/support/testing/tests/package/test_python_avro.py b/support/testing/tests/package/test_python_avro.py
> new file mode 100644
> index 0000000000..6eee2760da
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_avro.py
> @@ -0,0 +1,11 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonAvro(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_AVRO=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_avro.py"]
> -- 
> 2.23.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
