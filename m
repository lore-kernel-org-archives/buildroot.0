From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Jul 2015 18:47:09 +0200
Subject: [Buildroot] [PATCH 3/3] qt5quick1, qt5script,
 qt5webkit: tag as deprecated
In-Reply-To: <563d2a2d-458d-48eb-a9ce-93ff15f4b978@MAIL-SINTERS-01.sinters-int.fr>
References: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
 <4fef60e5-fbfb-4595-8c48-646c3d00a3d0@MAIL-SINTERS-01.sinters-int.fr>
 <20150703094304.663cee42@free-electrons.com>
 <563d2a2d-458d-48eb-a9ce-93ff15f4b978@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <5596BC8D.4020104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 10:55, Julien CORJON wrote:
> 
> Thomas,
> 
> Le 03/07/2015 09:43, Thomas Petazzoni a ?crit :
[snip]
>> However, I'm wondering if we should not simply make them depend on
>> BR2_DEPRECATED_SINCE_2015_08. But that will make them disappear
>> completely by default, unless the user enables BR2_DEPRECATED.
>>
>> Actually, our deprecation/removal process is a bit weird: deprecated
>> should be a smoother thing than removal. But in practice, when we
>> deprecate something by making it 'depends on
>> BR2_DEPRECATED_SINCE_YYYY_MM', it gets automatically removed from your
>> configuration without any notification (unless you enable manually
>> BR2_DEPRECATED, of course). While if we remove it entirely, we add it
>> to Config.in.legacy, and the users upgrading get a clear notification.
>>
>> So users are better notified of removals than deprecations.
>>
>> Arnout, what do you think about this?

 Good point indeed. But I don't see a simple solution. We could use the same
approach as for legacy (selecting a symbol and printing a big fat warning
comment), but then it's easy for a user to accidentally select one of the
deprecated options, and that's exactly what we want to avoid.

 So we'd have to look for things like temporarily enabling
BR2_DEPRECATED_SINCE_* through the environment when 'make oldconfig' is run, or
when one of the deprecated packages was selected before you do 'make
menuconfig', but not when you do 'make menuconfig' from the beginning. It
quickly becomes pretty dirty... Something for Yann, perhaps :-)

> 
> For now Qt tag these 3 modules as deprecated but they did not reach the 
> end of life.
> 
> In my opinion, users who start a new design should be informed that in 
> the near future these modules will not be supported anymore when user 
> who need to bump Qt for they existing design (as we do) should be able 
> to do that without loosing they already existing configuration.

 +1 to that. In fact, qt5quick1 and qt5script are both compatibility layers for
qt4 legacy, just like BR2_PACKAGE_QT_QT3SUPPORT. So they were 'deprecated' from
the beginning. So instead of (deprecated), perhaps (legacy compatibility) is a
better tag.

 But that doesn't really fit with our rule of thumb that menu entries should be
just the package name. Therefore, I'm more in favour of moving this stuff in a
separate area with a comment delimiter as Julien originally proposed. But then
without the (deprecated) tag.


 Regards,
 Arnout

> 
> For these reasons I don't think we should use 
> BR2_DEPRECATED_SINC_YYYY_MM neither add them to Config.in.legacy since 
> this is not a Buildroot issue but a Qt one.
> 
> At the end, when Qt will stop provide these module, we should add them 
> to Config.in.legacy.
> 
>>
>> Thomas
>>
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
