From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Aug 2014 09:43:03 +0200
Subject: [Buildroot] [PATCH 1 of 4 v2 for 2014.08] gendoc infra: use
	$(pkgname) instead of explicitly passing 'manual'
In-Reply-To: <20140812204635.GE4055@free.fr>
References: <patchbomb.1407867067@localhost>
 <8a3834f24594bf372176.1407867068@localhost> <20140812203233.GD4055@free.fr>
 <20140812204635.GE4055@free.fr>
Message-ID: <8b1478a6-2de6-4ae8-bf3f-d73e68adee85@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Thomas, All,
>
>On 2014-08-12 22:32 +0200, Yann E. MORIN spake thusly:
>> On 2014-08-12 20:11 +0200, Thomas De Schampheleire spake thusly:
>> > In the gendoc infrastructure, using an assignment of the form
>> >     FOO = docs/$(1)/bar
>> > inside GENDOC_INNER does not work as expected: the $(1) value is empty here
>> > and the value of FOO becomes 'docs//bar'.
>> > 
>> > Parameters $(2), $(3), etc. do not have this problem. The specific thing
>> > about $(1) is that it is a parameter to GENDOC itself (indicating the
>> > document to create) and passed transparently to GENDOC_INNER.
>> > 
>> > This is different from the package infrastructures, where $(1) is set from
>> > $(pkgname). In fact, the same strategy could be used by the gendoc
>> > infrastructure as well, as $(pkgname) resolves to 'manual' for file
>> > docs/manual/manual.mk. This has the advantage that the described problem
>> > does not occur.
>> > 
>> > Note that this means that if we want to use the same GENDOC infrastructure
>> > for another document, it will have to reside in a separate directory than
>> > the manual.
>> 
>> This breaks generating the manual:
>> 
>>     $ make manual-html
>>     make: *** No rule to make target `manual-html'.  Stop.
>>     $ make manual
>>     make: *** No rule to make target `manual'.  Stop.
>
>That's because $(pkgname) returns empty, because $(pkgdir) returns
>empty, because I do not have a .config file.
>
>So, before this patch, it was possible to build the manual from a
>pristine Buildroot tree; now it is no longer possible.
>
>I think that's bad.

Agreed. The problem is that pkg-utils.mk is only
included when a config file is present.
Based on this, I see three possibilities:

1. Include pkg-utils.mk unconditionally from Makefile
 (currently included from package/Makefile.in)

2. Move the definition of pkgname and pkgdir to
 Makefile (outside the check on the config file)

3. Don't use pkgname/pkgdir for the manual
 generation rules, and try to solve the issue with $1 on
 a different way (I feel double dollar signs coming up
 somewhere...)

Best regards,
Thomas
