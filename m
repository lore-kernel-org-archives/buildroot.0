From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2019 10:50:10 +0200
Subject: [Buildroot] [PATCH 2/4] package/libnss: fix build warning
In-Reply-To: <12cfd147-ec8c-50f5-46a5-b01d025eb1d5@mind.be>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
 <20191023102330.20842-2-giulio.benetti@benettiengineering.com>
 <12cfd147-ec8c-50f5-46a5-b01d025eb1d5@mind.be>
Message-ID: <2b649a38-f923-7e55-e8a2-141d8a41fc4e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/10/2019 10:47, Arnout Vandecappelle wrote:
> 
> 
> On 23/10/2019 12:23, Giulio Benetti wrote:
>> Add patch to fix build warning due to uninitialized variable.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> https://bugzilla.mozilla.org/show_bug.cgi?id=1590678
>> ---
>>  ...ve-Wmaybe-uninitialized-warning-in-t.patch | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch
>>
>> diff --git a/package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch b/package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch
>> new file mode 100644
>> index 0000000000..956abeb4a5
>> --- /dev/null
>> +++ b/package/libnss/0004-Bug-1590678-Remove-Wmaybe-uninitialized-warning-in-t.patch
>> @@ -0,0 +1,27 @@
>> +From 24bcc8860310149da1524dbf25f3bc77f6476b11 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Wed, 23 Oct 2019 11:58:12 +0200
>> +Subject: [PATCH] Bug 1590678 - Remove -Wmaybe-uninitialized warning in
>> + tls13esni.c
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + nss/lib/ssl/tls13esni.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/nss/lib/ssl/tls13esni.c b/nss/lib/ssl/tls13esni.c
>> +index 4d2e12d62..a7ce6f568 100644
>> +--- a/nss/lib/ssl/tls13esni.c
>> ++++ b/nss/lib/ssl/tls13esni.c
>> +@@ -728,7 +728,7 @@ tls13_ServerDecryptEsniXtn(const sslSocket *ss, const PRUint8 *in, unsigned int
>> + {
>> +     sslReader rdr = SSL_READER(in, inLen);
>> +     PRUint64 suite;
>> +-    const ssl3CipherSuiteDef *suiteDef;
>> ++    const ssl3CipherSuiteDef *suiteDef = NULL;
> 
>  Although this looks OK at first sight, it's something that might be dangerous
> (i.e. the wrong fix). Since this is a security package, I don't want to apply it
> until upstream gives feedback.

 On second thought, since we don't enable -Werror in Buildroot, we don't need
this patch AFAICS. So it's good that you reported it upstream, but we're not
going to apply this patch. I've marked it as Rejected.

 Regards,
 Arnout
