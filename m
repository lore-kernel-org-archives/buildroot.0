From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Apr 2015 16:43:08 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/python-web2py: new package
In-Reply-To: <20150413162140.7851d045@free-electrons.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
 <1428933447-32061-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150413162140.7851d045@free-electrons.com>
Message-ID: <CA+TH9V=m3fCRPzt+vPKV3m=o5KL8W7DaxokRp1WFKNH07zzf0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-04-13 16:21 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Mon, 13 Apr 2015 15:57:27 +0200, Angelo Compagnucci wrote:
>
>> diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
>> new file mode 100644
>> index 0000000..c376856
>> --- /dev/null
>> +++ b/package/python-web2py/Config.in
>> @@ -0,0 +1,26 @@
>> +config BR2_PACKAGE_PYTHON_WEB2PY
>> +     bool "python-web2py"
>> +     depends on BR2_PACKAGE_PYTHON
>> +     select BR2_PACKAGE_PYTHON_PYDAL
>> +     select BR2_PACKAGE_ZLIB
>
> Not needed.

Ok!

>
>> +     select BR2_PACKAGE_PYTHON_ZLIB
>> +     select BR2_PACKAGE_EXPAT
>
> Ditto.

Ok!

>
>> +     select BR2_PACKAGE_PYTHON_PYEXPAT
>> +     select BR2_PACKAGE_SQLITE
>
> Ditto.

Ok!

>
> Those are already selected by BR2_PACKAGE_PYTHON_{ZLIB,PYEXPAT,SQLITE}
> respectively.
>
>> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
>> new file mode 100644
>> index 0000000..828b662
>> --- /dev/null
>> +++ b/package/python-web2py/python-web2py.mk
>> @@ -0,0 +1,46 @@
>> +################################################################################
>> +#
>> +# python-web2py
>> +#
>> +################################################################################
>> +
>> +PYTHON_WEB2PY_VERSION = R-2.10.3
>> +PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
>> +PYTHON_WEB2PY_SITE_METHOD = git
>
> github function?

Ok, I will use it.

>> +PYTHON_WEB2PY_LICENSE = LGPLv3
>> +PYTHON_WEB2PY_LICENSE_FILES = LICENSE
>> +PYTHON_WEB2PY_DEPENDENCIES = python sqlite
>
> It really depends on sqlite itself? Or only the Python sqlite module?

It depends on python sqlite, I will look into setting the proper
dependencies. Probably only python would suffice, cause python-sqlite
is always compiled with python cause it's selected.

>> +define PYTHON_WEB2PY_PYDAL_COPY
>> +     cp -rf $(PYTHON_PYDAL_SRCDIR)/*  $(@D)/gluon/packages/dal/
>> +endef
>> +
>> +PYTHON_WEB2PY_POST_EXTRACT_HOOKS += PYTHON_WEB2PY_PYDAL_COPY
>> +
>> +define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
>> +     $(HOST_DIR)/usr/bin/python2 -c 'import os; \
>> +             os.chdir("$(@D)"); \
>> +             from gluon.main import save_password; \
>> +             save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
>> +     mkdir -p $(TARGET_DIR)/usr/share/web2py
>> +     cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/web2py
>> +endef
>> +
>> +define PYTHON_WEB2PY_INSTALL_INIT_SYSV
>> +     $(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
>> +             $(TARGET_DIR)/etc/init.d/S51web2py
>> +endef
>> +
>> +define PYTHON_WEB2PY_INSTALL_INIT_SYSTEMD
>> +     $(INSTALL) -D -m 0644 package/python-web2py/web2py.service \
>> +             $(TARGET_DIR)/etc/systemd/system/web2py.service
>
> I think we changed the installation of .service files to /usr/lib. See
> commit af17811662595ad1db0a992a3a7446c79d40d578 for example.

Ouch! I will fix it!

>> +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +     ln -fs ../web2py.service \
>> +             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/web2py.service
>> +endef
>> +
>> +define PYTHON_WEB2PY_PERMISSIONS
>> +     /usr/share/web2py  r  750  www-data  www-data  -  -  -  -  -
>> +endef
>> +
>> +$(eval $(generic-package))
>
> This package has a setup.py. Any reason why you're not using it,
> together with the python-package infrastructure?

I can try! Honestly, I've not explored the option cause web2py is self
contained and it doesn't require installation. It uses a writable
directory for served applications, so suing a custom directory un
/usr/share with writing permission setted to www-data seemed the most
sensible choice.

Thank you!

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
