From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:36:00 +0200
Subject: [Buildroot] [PATCH v8 09/14] support/scripts/check-host-rpath:
 silent find command
In-Reply-To: <1460929111-15615-10-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-10-git-send-email-s.martin49@gmail.com>
Message-ID: <20160418213600.540c90dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 23:38:26 +0200, Samuel Martin wrote:

> -    done < <(find "${hostdir}"/usr/{bin,sbin} -type f -print |
> +    done < <(find "${hostdir}"/usr/{bin,sbin} -type f -print 2>/dev/null |
>                    readelf.filter_elf_executable)

This patch is useless. Your patch 08/14 is doing:

-    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
-              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
-                      -e 's//\1/'                                                  \
-            )
+    done < <(find "${hostdir}"/usr/{bin,sbin} -type f -print |
+                  readelf.filter_elf_executable)

So essentially the 2>/dev/null was already here, and you remove it. And
then you add it again in your patch 09/14. Simply squash both patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
