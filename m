From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 15 Apr 2015 01:21:52 +0200
Subject: [Buildroot] [PATCH 1/1] json-c: bump version to
	json-c-0.12-20140410
In-Reply-To: <20150414091501.GQ2279@tarshish>
References: <1429002618-22546-1-git-send-email-sagaert.johan@proximus.be>
 <20150414091501.GQ2279@tarshish>
Message-ID: <552DA110.5050001@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach schreef op 14/04/2015 om 11:15:
> Hi Sagaert Johan,
>
> On Tue, Apr 14, 2015 at 11:10:18AM +0200, Sagaert Johan wrote:
>> diff --git a/package/json-c/0001-remove-unused-assignment.patch b/package/json-c/0001-remove-unused-assignment.patch
>> new file mode 100644
>> index 0000000..369e89f
>> --- /dev/null
>> +++ b/package/json-c/0001-remove-unused-assignment.patch
>> @@ -0,0 +1,30 @@
>> +From 35087bf7775481fbb880d38cde03ea654474dfa1 Mon Sep 17 00:00:00 2001
>> +From: Sagaert Johan <sagaert.johan@proximus.be>
>> +Date: Tue, 14 Apr 2015 10:43:05 +0200
>> +Subject: [PATCH 1/1] remove unused asignment
>> +
>> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
>> +---
>> + json_tokener.c | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/json_tokener.c b/json_tokener.c
>> +index 19de8ef..9a76293 100644
>> +--- a/json_tokener.c
>> ++++ b/json_tokener.c
>> +@@ -352,12 +352,10 @@ struct json_object* json_tokener_parse_ex(struct json_tokener *tok,
>> +
>> +     case json_tokener_state_inf: /* aka starts with 'i' */
>> +       {
>> +-	int size;
>> + 	int size_inf;
>> + 	int is_negative = 0;
>> +
>> + 	printbuf_memappend_fast(tok->pb, &c, 1);
>> +-	size = json_min(tok->st_pos+1, json_null_str_len);
>> + 	size_inf = json_min(tok->st_pos+1, json_inf_str_len);
>> + 	char *infbuf = tok->pb->buf;
>> + 	if (*infbuf == '-')
> It seems this packages builds with -Werror, hence the need for this patch to
> avoid build breakage. A better solution, in my opinion, is to remove -Werror.
>
> baruch
>
Dear Baruch

i tried
diff --git a/Makefile.am.inc b/Makefile.am.inc
index fec591b..61db1d2 100644
--- a/Makefile.am.inc
+++ b/Makefile.am.inc
@@ -1,2 +1,2 @@
-AM_CFLAGS = -Wall -Werror -Wno-error=deprecated-declarations -Wextra 
-Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
+AM_CFLAGS = -Wall -Wno-error=deprecated-declarations -Wextra 
-Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT

-- 
2.3.3

but this seems to yield this unexpected error.

 >>> json-c json-c-0.12-20140410 Building
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-cmake-3.0.2/bin" 
/usr/bin/make -j1  -C 
/home/buildroot12git/output/build/json-c-json-c-0.12-20140410/
make[1]: Entering directory 
`/home/buildroot12git/output/build/json-c-json-c-0.12-20140410'
  cd . && /bin/sh 
/home/buildroot12git/output/build/json-c-json-c-0.12-20140410/missing 
automake-1.14 --gnu Makefile
/home/buildroot12git/output/build/json-c-json-c-0.12-20140410/missing: 
line 81: automake-1.14: command not found
WARNING: 'automake-1.14' is missing on your system.
          You should only need it if you modified 'Makefile.am' or
          'configure.ac' or m4 files included by 'configure.ac'.
          The 'automake' program is part of the GNU Automake package:
          <http://www.gnu.org/software/automake>
          It also requires GNU Autoconf, GNU m4 and Perl in order to run:
          <http://www.gnu.org/software/autoconf>
          <http://www.gnu.org/software/m4/>
          <http://www.perl.org/>
make[1]: *** [Makefile.in] Error 127
make[1]: Leaving directory 
`/home/buildroot12git/output/build/json-c-json-c-0.12-20140410'
make: *** 
[/home/buildroot12git/output/build/json-c-json-c-0.12-20140410/.stamp_built] 
Error 2
return of make was 2

I don't see why.

Regards , Johan
