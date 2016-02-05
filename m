From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Feb 2016 20:58:54 +0100
Subject: [Buildroot] [PATCH 1/2] yad: fix libgtk2 related dependency
	error
In-Reply-To: <56B1EFEC.4040801@zacarias.com.ar>
References: <1454464356-12637-1-git-send-email-ricardo.martincoski@gmail.com>
 <56B1EFEC.4040801@zacarias.com.ar>
Message-ID: <56B4FEFE.2050408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-02-16 13:17, Gustavo Zacarias wrote:
> On 02/02/16 22:52, Ricardo Martincoski wrote:
> 
>> --- a/package/yad/Config.in
>> +++ b/package/yad/Config.in
>> @@ -2,6 +2,7 @@ config BR2_PACKAGE_YAD
>>       bool "yad"
>>       depends on BR2_PACKAGE_XORG7
>>       depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
>> +    select BR2_PACKAGE_LIBGTK3_X11 if BR2_PACKAGE_LIBGTK3
>>       help
>>         YAD (yet another dialog) is a tool for create graphical dialogs
>>         from shell scripts.
> 
> Hi.
> This logic is severely broken, you can't force X11 if someone is using gtk3 with
> say broadway or wayland.

At least in the current (broken) libgtk3, you can select X11 and wayland in
parallel.

> Not to mention BR2_PACKAGE_LIBGTK3_X11 depends on xorg being selected.

 The depends is two lines higher.


> 
>> -ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> 
> This isn't accurate either, you first say it needs x11 by selecting it, but you
> then basically say no?

 Since LIBGTK3_X11 was selected if LIBGTK3, either one has the same effect.


 Regards,
 Arnout


> Regards.
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
