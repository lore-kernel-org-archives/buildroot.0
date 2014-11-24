From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 24 Nov 2014 22:05:37 +0100
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
	installation
In-Reply-To: <20141124203453.59c5f279@free-electrons.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
 <20141122213359.2628a10e@free-electrons.com>
 <54730753.3030108@zacarias.com.ar>
 <20141124203453.59c5f279@free-electrons.com>
Message-ID: <CA+sos7_JzpU07bYQRvNN8wU1p5nuiQXyR2dTUqEwGE63aJJJ=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mon, Nov 24, 2014 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gustavo Zacarias,
>
> On Mon, 24 Nov 2014 07:24:19 -0300, Gustavo Zacarias wrote:
>
>> > I must say I'm a bit skeptical about two things (about which probably
>> > Beno?t can give some details) :
>> >
>> >  * The usefulness of enabling the NSS libraries in non-glibc
>> >    environments. Even though I agree that technically, nothing prevents
>> >    some program from using them, in practice, the NSS libraries are
>> >    basically only used by the glibc name resolution logic. So I would
>> >    personally prefer to make those NSS libraries visible only in glibc
>> >    configurations.
>>
>> Even if they can be built they really are intended for (e)glibc so we agree.
>> If you need to access/use wbclient functionality you could just use the
>> wbclient (winbind) api by enabling samba install to staging, that's the
>> public way of accessing it.
>
> Agreed.

OK, I will change that.

>> >  * The fact that the winbindd daemon is not actually needed on the
>> >    target to get libnss_wins/libnss_winbind working. My understanding
>> >    is that winbindd is a daemon that will answer to the name resolution
>> >    requests of libnss_wins/libnss_winbind, so I don't see how they can
>> >    work without the daemon running.
>>
>> AFAIK you need winbind running in order to use libwbclient and/or
>> libnss_winbind/wins. I think libnss_wins has a fallback to DNS-only mode
>> but it's probably not very useful.
>
> Ok.

From:
https://www.samba.org/samba/docs/man/manpages/winbindd.8.html
https://git.samba.org/?p=samba.git;a=blob;f=docs-xml/manpages-3/winbindd.8.xml;h=71829fb124950d901eb0516f77b5b9b4e41035ca;hb=refs/heads/v3-6-stable

"Even if winbind is not used for nsswitch, it still provides a service
to smbd, ntlm_auth and the pam_winbind.so PAM module, by managing
connections to domain controllers."

So libnss_wins / winbind do not directly require the winbindd daemon
to be running in order to resolve names. I had tested this case, and
it works fine. But winbindd is still closely related to this change,
and maybe things do not work correctly without it in some network
environments, so I will do this change anyway.

> Beno?t, can you rework your patches to take into account those comments?

Sure, will do.

>> Also please note that Samba 3 is very likely going EOL as soon as Samba
>> 4.2.x is released which even though delayed a bit in the RC phase is
>> coming along pretty soon, so adding feature to the samba3 package isn't
>> very wise IMHO (it's in security-only fixes now).
>> See: https://wiki.samba.org/index.php/Samba_Release_Planning
>
> Ok. Still there's some chance that we will keep Samba 3 around for a
> bit of time, just like we still have libgtk2 available.

That would be great. samba4 is currently monolithic and huge for
embedded targets.

Best regards,
Beno?t
