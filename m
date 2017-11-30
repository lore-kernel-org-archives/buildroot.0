From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Thu, 30 Nov 2017 09:19:41 -0200 (BRST)
Subject: [Buildroot] [PATCH 7/8] package/asterisk: add comment about a
 check-package false positive
In-Reply-To: <20171130090057.2d034d10@windsurf.home>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
 <20171130090057.2d034d10@windsurf.home>
Message-ID: <1054252197.2705387.1512040781069.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thursday, November 30, 2017 6:00:57 AM, Thomas Petazzoni wrote:
> On Thu, 30 Nov 2017 00:08:44 +0100, Yann E. MORIN wrote:
[snip]
>> +++ b/package/asterisk/asterisk.mk
>> @@ -285,6 +285,7 @@ HOST_ASTERISK_LICENSE_FILES = COPYING
>>  
>>  # No need to autoreconf for the host variant,
>>  # so do not inherit the target setup.
>> +# check-package reports an issue here, but that's a false positive. Ignore.
>>  HOST_ASTERISK_AUTORECONF = NO
> 
> I'm not sure we should have a comment here. Instead we should fix
> check-package: it is not normal for check-package to emit a warning
> here, since it is legal (currently) for a package to autoreconf its
> target variant, and not autoreconf its host variant.

I agree, it's better to not issue a false warning.

> 
> Ricardo, do you think you could fix this problem in check-package ?

We can use something like this (not fully tested yet!):

+++ utils/checkpackagelib/lib_mk.py
@@ -219 +219 @@ class UselessFlag(_CheckFunction):
-        if self.DEFAULT_AUTOTOOLS_FLAG.search(text):
+        if self.DEFAULT_AUTOTOOLS_FLAG.search(text) and not text.lstrip().startswith("HOST_"):

Avoiding false warnings is more important than testing for all corner
cases IMO. Using the code above we don't issue a valid warning for
rare cases, we stop issuing a false warning and we also keep O(n).

I will send it separately (after proper commit message and testing)
if Yann doesn't include something similar (feel free to do so!) to
the series before.

Regards,
--
Ricardo Martincoski
DATACOM 
Ethernet Switches 
Rua Am?rica, 1000 - Eldorado do Sul, RS - 92990-000 - Brasil
+55 51 3933 3000 - Ramal 3307
ricardo.martincoski at datacom.ind.br
www.datacom.ind.br
