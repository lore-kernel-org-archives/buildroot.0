From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 15 Mar 2013 13:33:22 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-thrift: new package
In-Reply-To: <CALD9WKwqdDxRH5ZSQfLMeuj=C7JTGsseQZUEYRXoRhik32ab2w@mail.gmail.com>
References: <1363185808-14279-1-git-send-email-viniciustinti@gmail.com>
 <5140E302.4020500@mind.be>
 <CALD9WKwqdDxRH5ZSQfLMeuj=C7JTGsseQZUEYRXoRhik32ab2w@mail.gmail.com>
Message-ID: <51431512.6050406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/13 17:15, Tinti wrote:
> On Wed, Mar 13, 2013 at 5:35 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
>
>     On 03/13/13 15:43, Vinicius Tinti wrote:
[snip]
>         b/package/python-thrift/python__-thrift.mk <http://python-thrift.mk>
>         new file mode 100644
>         index 0000000..40ae57b
>         --- /dev/null
>         +++ b/package/python-thrift/python__-thrift.mk
>         <http://python-thrift.mk>
>         @@ -0,0 +1,23 @@
>         +#############################__##############################__##
>         +#
>         +# python-thrift
>         +#
>         +#############################__##############################__##
>         +
>         +PYTHON_THRIFT_VERSION = 0.9.0
>         +PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
>
>
>       This is the default, so can be removed.
>
>
> Can I keep it? I think it makes more clear.

  Although I agree, the rule in buildroot is that it is removed when it 
is the default. So no, you cannot keep it.

>
>         +PYTHON_THRIFT_SITE =
>         https://pypi.python.org/__packages/source/t/thrift/
>         <https://pypi.python.org/packages/source/t/thrift/>
>         +PYTHON_THRIFT_LICENSE = Apache v2.0
>
>
>       We currently have Apache-v2 (ImageMagick), Apache-2.0 (lua-msgpack)
>     and Apache v2.0 (zxing). I personally prefer Apache-2.0.
>
>
> Changed to Apache-2.0.

  Apache-2.0 is just my personal preference, so wait a bit until some 
others have voiced their opinion.


>         +PYTHON_THRIFT_LICENSE_FILES = README
>         +
>         +PYTHON_THRIFT_DEPENDENCIES = python
>         +
>         +define PYTHON_THRIFT_BUILD_CMDS
>         +       (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
>         +endef
>         +
>         +define PYTHON_THRIFT_INSTALL_TARGET___CMDS
>         +       (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install
>         --prefix=$(TARGET_DIR)/usr)
>         +endef
>
>
>       Unfortunately, installation fails when host-python-distutilscross
>     has been installed already (by python-protobuf or python-netifaces).
>
>     ------
>     running install
>     Checking .pth file support in
>     $(TARGET_DIR)/usr/lib/python2.__7/site-packages/
>     $(HOST_DIR)/usr/bin/python -E -c pass
>     TEST FAILED: $(TARGET_DIR)/usr/lib/python2.__7/site-packages/ does
>     NOT support .pth files
>     error: bad install directory or PYTHONPATH
>
>     You are attempting to install a package to a directory that is not
>     on PYTHONPATH and which Python does not read ".pth" files from.  The
>     installation directory you specified (via --install-dir, --prefix, or
>     the distutils default setting) was:
>
>          $(TARGET_DIR)/usr/lib/python2.__7/site-packages/
>     ------
>
>       What happens is very clear: we're installing using the host-python,
>     which doesn't look at TARGET_DIR to load packages. I would expect
>     that distutilscross knows how to deal with that, but haven't found how...
>
>
>
> I have used the code from python-netifaces. It builds without generating
> an error at least. Do you think it is ok?

  Strange... Can you check that if you first build 
host-python-distutilscross and then python-thrift, it still works for 
you? So:

make python-distutilscross
make python-thrift-dirclean
make python-thrift

  And a sanity check: do you use current git master as a base?

>
> +define PYTHON_THRIFT_BUILD_CMDS
> +       (cd $(@D); \
> +               PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
> +               LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
> +       $(HOST_DIR)/usr/bin/python setup.py build -x)
> +endef
> +
> +define PYTHON_THRIFT_INSTALL_TARGET_CMDS
> +       (cd $(@D);
> PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> \
> +       $(HOST_DIR)/usr/bin/python setup.py install
> --prefix=$(TARGET_DIR)/usr)
> +endef


  I have no problem with this workaround, even though it is a bit ugly. 
You should add a comment to explain why this is needed though (before the 
define, otherwise the comment is interrupting the backslashified region).

  When you send a new patch with this change, I'll test it in my environment.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
