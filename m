From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jun 2016 01:27:27 +0200
Subject: [Buildroot] Buildroot package for psycopg module for Beaglebone
 black
In-Reply-To: <57725E95.3040107@gmail.com>
References: <57725E95.3040107@gmail.com>
Message-ID: <2c149f23-5762-32d8-f298-5f0af402c480@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-06-16 13:25, pborut123 wrote:
> Hello,
> 
> I'm new to this mailing list, quite new to buildroot, too.
> I'm trying to build distribution for Beaglebone black with Python 3.5.1 and
> postgresql 9.5.2.
> I want to have also psycopg2 module that is not present in current package list.
> I've tried to make my own package but I'm not successful.
> 
> Last error, I've received from build is at installation step:
>>>> python-psycopg 2.6.1 Installing to target
> ...
> error: option --executable not recognized

 We're missing some context here: which command issued this error? It should be
written a few lines above.

> make: ***
> [..buildroot/output/build/python-psycopg-2.6.1/.stamp_target_installed] Error 1
> 
> My question is if can anybody help me with this, pointing me on what I've done
> wrong.
> 
> Here is my package code:
> 
> PYTHON_PSYCOPG_VERSION = 2.6.1
> PYTHON_PSYCOPG_SOURCE = psycopg2-$(PYTHON_PSYCOPG_VERSION).tar.gz
> PYTHON_PSYCOPG_SITE = http://initd.org/psycopg/tarballs/PSYCOPG-2-6
> PYTHON_PSYCOPG_LICENSE = GPLv2
> PYTHON_PSYCOPG_LICENSE_FILES = LICENSE
> PYTHON_PSYCOPG_SETUP_TYPE = setuptools
> PYTHON_PSYCOPG_BUILD_OPTS = build_ext --pg-config
> $(STAGING_DIR)/usr/bin/pg_config build
> 

 You will certainly need

PYTHON_PSYCOPG_DEPENDENCIES = postgresql

> define PYTHON_PSYCOPG_INSTALL_CUSTOM_PG_CONFIG
>     $(INSTALL) -m 0755 -D package/python-psycopg/pg_config \
>         $(STAGING_DIR)/usr/bin/pg_config

 Eek? Why would you want to do this? You should use the pg_config provided by
postgresql, otherwise things will probably go wrong.

 Regards,
 Arnout


> endef
> PYTHON_PSYCOPG_PRE_BUILD_HOOKS += PYTHON_PSYCOPG_INSTALL_CUSTOM_PG_CONFIG
> $(eval $(python-package))
> 
> and here is missing host pg_config file, I've inserted to setup.py:
> 
> #!/bin/sh
> # I've pointed to already cross-build posgresql base directory in build
> prefix=buildroot/output/build/postgresql-9.5.2/src
> 
> case "$1" in
>   --includedir)
>     echo "$prefix/include"
>     ;;
>   --libdir)
>     echo "$prefix/lib"
>     ;;
>   --version)
>       echo "PostgreSQL 9.5.2"
>     ;;
> 
>   *)
>     echo "Usage: $0 {--includedir|--libdir}"
> esac
> 
> Thank you and best regards,
> Borut.
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
