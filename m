From: =?ISO-8859-15?Q?Markus_K=F6nigshaus?= <m.koenigshaus@wut.de>
Date: Thu, 28 Mar 2013 13:58:46 +0100
Subject: [Buildroot] Bug in uClibc-0.9.33.2 resolv.c
Message-ID: <51543E86.9000706@wut.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have found a bug in resolv.c in conjunction with the function 
res_init: res_init sets __ res_sync to res_sync_func and then calls 
__res_vinit.
-> __res_vinit calls __ open_nameservers.
In __open_nameservers __nameserver and __nameservers are set by the 
contents of resolv.conf. So far so good.
-> __open_nameserver calls res_sync_func
         In res_sync_func__nameservers is set to rp->nscount, what is 0.
Backin _res_vinit rp->nscount is set to __nameservers then, what is 0. 
So the cat bites its own tail.

Attached is a simple patch, that fixes the problemby setting __res_sync 
after calling __res_vinit.

Before this patch with busybox "nslookup www.google.de" ->

nslookup: can not resolve '(null)': Name or service not known

Name: www.google.de
Address 1: 2a00: 1450:4016:800 :: 101f muc03s01-in-x1f.1e100.net
Address 2: 173.194.35.151 muc03s01-in-f23.1e100.net
Address 3: 173.194.35.159 muc03s01-in-f31.1e100.net
Address 4: 173.194.35.152 muc03s01-in-f24.1e100.net

After the patch "nslookup www.google.de" ->

nslookup www.google.de
Server: 8.8.8.8
Address 1: 8.8.8.8 google-public-dns-a.google.com

Name: www.google.de
Address 1: 2a00: 1450:4016:803 :: 1018 muc03s08-in-x18.1e100.net
Address 2: 173.194.44.56 muc03s08-in-f24.1e100.net
Address 3: 173.194.44.55 muc03s08-in-f23.1e100.net
Address 4: 173.194.44.63 muc03s08-in-f31.1e100.net

This patch ist tested with buildroot-02.13.

Regards, Markus


-- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie Entscheidungen 
auf Grundlage dieser Aussagen treffen.
Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
Registergericht: Amtsgericht Wuppertal, HRB 6377 
Tel. +49-202/2680-0, Fax +49-202/2680-265, http://www.wut.de
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.33.2-resolv_c.patch
Type: text/x-patch
Size: 559 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130328/5f80aa6c/attachment.bin>
