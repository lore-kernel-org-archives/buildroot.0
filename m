From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 15 Feb 2013 22:38:38 +0200
Subject: [Buildroot] [PATCHv5 2/2] wireshark: new package
In-Reply-To: <511E9BDA.7010904@petroprogram.com>
References: <f903151303143f85e1e9c69b1f20400af878be97.1359870806.git.baruch@tkos.co.il>
 <f41bbd107d237f76229f44b7d78fcec962c15309.1359870806.git.baruch@tkos.co.il>
 <510E53EB.7020704@petroprogram.com>
 <20130214045630.GA15440@sapphire.tkos.co.il>
 <511CFD48.8000300@petroprogram.com> <511D0638.90106@petroprogram.com>
 <511D0854.7010506@petroprogram.com> <20130215115112.GA1249@tarshish>
 <511E2637.4010008@petroprogram.com> <20130215122013.GB1249@tarshish>
 <511E9BDA.7010904@petroprogram.com>
Message-ID: <511E9CCE.7070403@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

15.2.2013 22:34, Stefan Fr?berg kirjoitti:
> [snip]
>>>>> BTW, Baruch did you manage to compile this version of wireshark against
>>>>> that gnutls 3 ?
>>>> Nope. I only tried OpenSSL which I already have on my target.
>>> Your .mk file needs --with-gnutls=no added to it's configuration in case
>>> both OpenSSL and gnutls are installed.
>>> And maybe later a submenu of choice what SSL (if any) implementation to
>>> use for decrypting.
>> Ok. I'll fix that in my next patch iteration.
>>
>>> I will try later this evening how far I get this time with compiling it.
>> Keep me posted.
>>
>> Thanks,
>> baruch
> After inspecting the following
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-analyzer/wireshark/wireshark-1.8.5.ebuild?view=markup
> http://www.linuxfromscratch.org/blfs/view/svn/basicnet/wireshark.html
>
> and most importantly,
>
> http://wiki.wireshark.org/SSL
>
> I found out that wireshark uses OpenSSL indirectly only when using
> kerberos (which buildroot does not currently have), only if the
> said kerberos has ssl support compiled in ("krb5-config --libs" spits'
> out -lcrypto) and only if you pass --with-ssl to wireshark config.
>
> For decrypting SSL streams the wireshark will use only, and *only*,
> GnuTLS and libgcrypt.
>
> So if you want to include SSL decrypting support by default then you should:
>
> 1 )   try that gentoo wireshark patch that adds support for compiling
> against gnutls v3
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-analyzer/wireshark/files/wireshark-1.8.3-gnutls3.patch?revision=1.1
>
> 2) Add --with-gnutls=yes to WIRESHARK_CONF_OPT
>
> 3)  Add gnutls to wireshark dependencies.
>
>  Also, when compiling against uClibc I had to add LIBS="-ldl" to
> WIRESHARK_CONF_ENV as a workaround to finish compiling.
> Ofcourse the prober fix for this would be a patch to configure.ac that
> would check if libdl exists and then add it to LIBS

Sorry, i meant configure.in   *not* configure.ac


Stefan
