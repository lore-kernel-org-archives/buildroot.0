From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 13:02:26 +0100
Subject: [Buildroot] [PATCH 1/1] host-python: Really do not use the
 system OpenSSL.
In-Reply-To: <20161117150649.5568-1-nicolas.cavallari@green-communications.fr>
References: <43b2e7d1-6366-3d98-89f1-d2ab7ca3db2c@green-communications.fr>
 <20161117150649.5568-1-nicolas.cavallari@green-communications.fr>
Message-ID: <2c158563-8cb5-f271-68e6-3c173bd2f3b1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 16:06, Nicolas Cavallari wrote:
> Even if buildroot patches host-python to not compile the 'ssl' module,
> the '_ssl' and '_hashlib' module are still compiled if python detects
> an usable OpenSSL installation.  This may break compilation if the
> system's OpenSSL has been updated to 1.1.0 because of a bug in python,
> see https://bugs.python.org/issue26470 for details.
> 
> If python does not detect an usable openssl installation for _hashlib,
> it uses internal implementation of common hash algorithms instead.
> 
> This modifies the configure.ac patch to also disable _ssl and _hashlib
> if --disable-ssl is used.
> 
> It must also modify setup.py to force enabling the internal
> implementation of hash algorithms if _hashlib is disabled, otherwise, if
> an usable openssl installation is detected, it will not compile
> them and python will end up with no hash algorithm implementation at all,
> breaking host-python-pycrypto and its reverse-dependencies like crda.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

 I'm facing this problem as well: host-python doesn't build anymore on my machine.

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 However, I wonder if this is the right approach. For me, it makes more sense to
fix patch 111 by modifying setup.py in the same patch, so that the entire ssl
detection is skipped if the ssl module is disabled. Something like:

         exts.append( Extension('_socket', ['socketmodule.c', 'timemodule.c'],
                                depends=['socketmodule.h'],
                                libraries=math_libs) )
-        # Detect SSL support for the socket module (via _ssl)
-        search_for_ssl_incs_in = [
-                              '/usr/local/ssl/include',
-                              '/usr/contrib/ssl/include/'
-                             ]
+        if 'ssl' in disabled_module_list:
+            # Force using the non-openssl fallbacks _md5 and _sha*.
+            have_any_openssl = False
+            have_usable_openssl = False
+            openssl_ver = 0
+        else:
+            # Detect SSL support for the socket module (via _ssl)
+            search_for_ssl_incs_in = [
+                                  '/usr/local/ssl/include',
+                                  '/usr/contrib/ssl/include/'
+                                ]
[...]

         if have_any_openssl:
             if have_usable_openssl:



 Regards,
 Arnout

> ---
>  .../019-force-internal-hash-if-ssl-disabled.patch  | 22 ++++++++++++++++++++++
>  package/python/111-optional-ssl.patch              |  3 ++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 package/python/019-force-internal-hash-if-ssl-disabled.patch
> 
> Not sure if I should have added my signed off on 111-optional-ssl.patch
> after modifying it.
> 
> diff --git a/package/python/019-force-internal-hash-if-ssl-disabled.patch b/package/python/019-force-internal-hash-if-ssl-disabled.patch
> new file mode 100644
> index 0000000..ff594ca
> --- /dev/null
> +++ b/package/python/019-force-internal-hash-if-ssl-disabled.patch
> @@ -0,0 +1,22 @@
> +Force the use of internal hash implementations if _hashlib is disabled.
> +
> +Otherwise, python ends up with no hash algorithm implementation at all,
> +breaking python-pycrypto and its reverse-dependencies.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +--- a/setup.py	2016-11-16 18:02:01.120854546 +0100
> ++++ b/setup.py	2016-11-17 09:52:32.485674999 +0100
> +@@ -863,6 +863,12 @@ class PyBuildExt(build_ext):
> +         have_usable_openssl = (have_any_openssl and
> +                                openssl_ver >= min_openssl_ver)
> + 
> ++        if '_hashlib' in disabled_module_list:
> ++            # Force using the non-openssl fallbacks _md5 and _sha*.
> ++            have_any_openssl = False
> ++            have_usable_openssl = False
> ++            openssl_ver = 0
> ++
> +         if have_any_openssl:
> +             if have_usable_openssl:
> +                 # The _hashlib module wraps optimized implementations
> diff --git a/package/python/111-optional-ssl.patch b/package/python/111-optional-ssl.patch
> index 956d2a0..89a8947 100644
> --- a/package/python/111-optional-ssl.patch
> +++ b/package/python/111-optional-ssl.patch
> @@ -1,6 +1,7 @@
>  Add an option to disable the ssl module
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>  
>  ---
>   configure.in |    6 ++++++
> @@ -17,7 +18,7 @@ Index: b/configure.ac
>  +AC_ARG_ENABLE(ssl,
>  +	AS_HELP_STRING([--disable-ssl], [disable SSL]),
>  +	[ if test "$enableval" = "no"; then
> -+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
> ++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
>  +  	  fi])
>  +
>   AC_ARG_ENABLE(dbm,
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
