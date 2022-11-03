Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BC8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 12:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6DF40B8E;
	Thu,  3 Nov 2022 12:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6DF40B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEw8UjvKVFAG; Thu,  3 Nov 2022 12:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E0F40498;
	Thu,  3 Nov 2022 12:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E0F40498
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 211B31BF404
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 12:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0ED460FCC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 12:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0ED460FCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Z4XUhCyFKH6 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 12:13:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79FE60FC6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D79FE60FC6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 12:13:24 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so4980587pjc.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 05:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IjcamHyrfhgWWhGShxMlt/jouKlSBoTshGRMC0qy6h8=;
 b=VYhO/T1FYj6jpgqjCChEBDQLvpxePTHo8Oc0b3iP3k2vnU8ncQpM+Q6CtBizDsQCKV
 tL4BaE0WEaEjQMzfDkuWRrWCjCd5oFWjb5Gsl+Ut8bY5I2MSvusvMNUN3YrDcHm90QtM
 eLlPBUn27YgIhdWrUajv01xJN6omBMDbKX0a8M8BUdUvDuBhGcxQ8QFCJ0g8lpT/YqL+
 O1FOBegLElCqAgrQuNb+rBPqddEueYZzbhZUsrzK9J8od2ZsPCCDT2z7BtIPCIhz1Gam
 rdDSjLvSYX5oT7r/eIf/s4IgyDTDTpKPoMTfDodgLBlVBzim9vwcvG6Uw1IycTPhPQOn
 SotA==
X-Gm-Message-State: ACrzQf3FDEaQNXVrpM9hbhKr4L3Hx54OApjkn3ug/WinEVDkbkMMQv7g
 wJmQUIymIFcM9VjaQyqpoxMNnshl+dIC0NY18LI=
X-Google-Smtp-Source: AMsMyM4WyovJEz+KWgi0fqUHvihqnNXkhuG4XifziJBiqVBqlCgppzdFwPqV6hTa4cmkDXrLxMc3RnnTgF+hvus4S+s=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr29476513plf.57.1667477604244; Thu, 03
 Nov 2022 05:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221103102102.924370-1-m.niestroj@grinn-global.com>
In-Reply-To: <20221103102102.924370-1-m.niestroj@grinn-global.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Nov 2022 08:13:12 -0400
Message-ID: <CADvTj4rC=HtUyXUZqVweZxih4mHbx6UKt42Xt=wOQK_VhTO9rg@mail.gmail.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IjcamHyrfhgWWhGShxMlt/jouKlSBoTshGRMC0qy6h8=;
 b=QAvukHLSMROFD/RVnhYe+8+QrKHvmuxq7UbA4VObixh2kA+Vee6Xy3MK2YzCTarvaG
 Va+QH+m7ex+/SrotyagmUUwwqWgIThHGxS1wjA1cZOO7Yj1VpZ4pSXR2aPYGDcxWYOrr
 mC8BwMJ/nqaQqyOg1hIr3FxAzr3yzN9Yp4/RbPbWyTvTiey8Jsq82qdKv9Va34ELZpjU
 vV4vBcLF+M07tkd2i1W93mluRnt+EBKIgDQUTrXcGNAV2yNGP3xE00P1hkePs946Kqof
 EHbe73qwM9hSjDdzQMNXrDNeSvktcpSDgJUG28KhSlIb+k40ppZKcN7QATOH6hljAjTF
 6C+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QAvukHLS
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-dbus-fast: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 3, 2022 at 6:21 AM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> v1 -> v2:
> * added REQUIRE_CYTHON=1 env and host-python-cython dependencies (suggested by
>   James)
>
>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  package/python-dbus-fast/Config.in            |  9 ++++
>  .../python-dbus-fast/python-dbus-fast.hash    |  5 +++
>  package/python-dbus-fast/python-dbus-fast.mk  | 16 +++++++
>  .../tests/package/sample_python_dbus_fast.py  | 44 +++++++++++++++++++
>  .../tests/package/test_python_dbus_fast.py    | 40 +++++++++++++++++
>  7 files changed, 117 insertions(+)
>  create mode 100644 package/python-dbus-fast/Config.in
>  create mode 100644 package/python-dbus-fast/python-dbus-fast.hash
>  create mode 100644 package/python-dbus-fast/python-dbus-fast.mk
>  create mode 100644 support/testing/tests/package/sample_python_dbus_fast.py
>  create mode 100644 support/testing/tests/package/test_python_dbus_fast.py
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7d27936992..6d670ae21a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1881,6 +1881,7 @@ F:        package/murata-cyw-fw/
>  F:     package/netdata/
>  F:     package/python-ansicolors/
>  F:     package/python-bleak/
> +F:     package/python-dbus-fast/
>  F:     package/python-dbus-next/
>  F:     package/python-iniconfig/
>  F:     package/python-intelhex/
> @@ -1892,6 +1893,7 @@ F:        package/python-typing-extensions/
>  F:     package/python-xmodem/
>  F:     package/rs485conf/
>  F:     package/turbolua/
> +F:     support/testing/tests/package/sample_python_dbus_fast.py
>  F:     support/testing/tests/package/sample_python_dbus_next.py
>  F:     support/testing/tests/package/sample_python_pytest.py
>  F:     support/testing/tests/package/sample_python_pytest_asyncio.py
> diff --git a/package/Config.in b/package/Config.in
> index 238d7813f0..db9e94f357 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1015,6 +1015,7 @@ menu "External python modules"
>         source "package/python-daphne/Config.in"
>         source "package/python-dataproperty/Config.in"
>         source "package/python-dateutil/Config.in"
> +       source "package/python-dbus-fast/Config.in"
>         source "package/python-dbus-next/Config.in"
>         source "package/python-decorator/Config.in"
>         source "package/python-defusedxml/Config.in"
> diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
> new file mode 100644
> index 0000000000..2665bd1964
> --- /dev/null
> +++ b/package/python-dbus-fast/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_DBUS_FAST
> +       bool "python-dbus-fast"
> +       select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
> +       select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
> +       help
> +         A faster version of dbus-next, a DBus library for Python with
> +         asyncio support.
> +
> +         https://github.com/bluetooth-devices/dbus-fast
> diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
> new file mode 100644
> index 0000000000..f0dceeb43d
> --- /dev/null
> +++ b/package/python-dbus-fast/python-dbus-fast.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/dbus-fast/json
> +md5  eebf2c558dd1af0f8f32b361e91f2fa3  dbus_fast-1.61.1.tar.gz
> +sha256  bda4a7d559047b74f409eda278f68f610a418e86ad3efa0368fa2ed240daa6b6  dbus_fast-1.61.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
> diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
> new file mode 100644
> index 0000000000..de7049ba22
> --- /dev/null
> +++ b/package/python-dbus-fast/python-dbus-fast.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# python-dbus-fast
> +#
> +################################################################################
> +
> +PYTHON_DBUS_FAST_VERSION = 1.61.1
> +PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
> +PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/dd/f4/a280d46b119d59f6a3d84abf474452ae76651558b0963ab8c48ae13b5a44
> +PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
> +PYTHON_DBUS_FAST_LICENSE = MIT
> +PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
> +PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
> +PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython
> +
> +$(eval $(python-package))
> diff --git a/support/testing/tests/package/sample_python_dbus_fast.py b/support/testing/tests/package/sample_python_dbus_fast.py
> new file mode 100644
> index 0000000000..c2855464a1
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_dbus_fast.py
> @@ -0,0 +1,44 @@
> +import asyncio
> +from dbus_fast.aio import MessageBus
> +from dbus_fast.service import ServiceInterface, method
> +import dbus_fast.introspection as intr
> +from dbus_fast import BusType
> +
> +
> +class SampleInterface(ServiceInterface):
> +    def __init__(self):
> +        super().__init__('test.interface')
> +
> +    @method()
> +    def Ping(self):
> +        pass
> +
> +    @method()
> +    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
> +        return what1 + what2
> +
> +
> +async def main():
> +    bus_name = 'dbus.fast.sample'
> +
> +    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
> +    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
> +
> +    await bus.request_name(bus_name)
> +
> +    service_interface = SampleInterface()
> +    bus.export('/test/path', service_interface)
> +
> +    introspection = await bus2.introspect(bus_name, '/test/path')
> +    assert type(introspection) is intr.Node
> +    obj = bus2.get_proxy_object(bus_name, '/test/path', introspection)
> +    interface = obj.get_interface(service_interface.name)
> +
> +    result = await interface.call_ping()
> +    assert result is None
> +
> +    result = await interface.call_concat_strings('hello ', 'world')
> +    assert result == 'hello world'
> +
> +
> +asyncio.run(main())
> diff --git a/support/testing/tests/package/test_python_dbus_fast.py b/support/testing/tests/package/test_python_dbus_fast.py
> new file mode 100644
> index 0000000000..5f67cfd8cc
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_dbus_fast.py
> @@ -0,0 +1,40 @@
> +import textwrap
> +
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3DBusFast(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_DBUS=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_DBUS_FAST=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_dbus_fast.py"]
> +
> +    def run_sample_scripts(self):
> +        config = \
> +            """
> +            <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
> +             "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +            <busconfig>
> +              <policy user="root">
> +                <allow own="dbus.fast.sample"/>
> +                <allow send_destination="dbus.fast.sample"/>
> +              </policy>
> +            </busconfig>
> +            """
> +        config = textwrap.dedent(config)
> +        config_dir = "/etc/dbus-1/system.d"
> +        config_fn = "dbus.fast.sample.conf"
> +
> +        # Setup and reload D-Bus configuration
> +        self.emulator.run("mkdir -p " + config_dir)
> +        self.emulator.run("cat > " + config_dir + "/" + config_fn +
> +                          " <<EOF" + config + "EOF")
> +        self.emulator.run("killall -SIGHUP dbus-daemon")
> +
> +        # Run test scripts
> +        super().run_sample_scripts()
> --
> 2.38.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
