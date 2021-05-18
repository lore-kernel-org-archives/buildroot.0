From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 21:42:50 +0200
Subject: [Buildroot] [PATCH] package/links: enable building graphics
 mode with only fb driver
In-Reply-To: <CAPCnQJ=TNmHQ+s-fhjYauZ521aC7eUdnUQSugFPJv8ayp1264w@mail.gmail.com>
References: <20210427091325.1488138-1-urjaman@gmail.com>
 <01b9f8cb-e83e-5e1f-228c-0e887c93915b@mind.be>
 <CAPCnQJ=TNmHQ+s-fhjYauZ521aC7eUdnUQSugFPJv8ayp1264w@mail.gmail.com>
Message-ID: <cd08716b-6ec5-c7b5-54c8-8ee46ac0b0de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/05/2021 11:26, Urja Rannikko wrote:
> Hi,
> 
> On Wed, May 5, 2021 at 11:08 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>  Still not good enough, I'm afraid :-) You also need to depend on gpm in the .mk
>> file.
>>
> It already does, atleast that's how i read this fragment in links.mk:
> 
> ifeq ($(BR2_PACKAGE_GPM),y)
> LINKS_CONF_OPTS += --with-gpm
> LINKS_DEPENDENCIES += gpm
> else
> LINKS_CONF_OPTS += --without-gpm
> endif
> 
> And yes links can use GPM in textmode-only build too, so that seems
> correct as-is.

 Oops, you're right, my bad.

 Applied to next, thanks!

 Regards,
 Arnout

> 
>>  Also, I'm thinking: maybe we can turn this around and automatically select gpm?
>>
>>         select BR2_PACKAGE_GPM if !BR2_PACKAGE_DIRECTFB && !BR2_PACKAGE_XORG7
>>
>>  That way you don't need the comment either. Well, you still do because gpm
>> depends on static:
>>
>>         depends on !BR2_STATIC_LIBS if !BR2_PACKAGE_DIRECTFB && !BR2_PACKAGE_XORG7 # gpm
>>
>> so the comment would become:
>>
>> comment "links graphics needs dynamic libs, DirectFB or X11"
>>         depends on BR2_STATIC_LIBS && !BR2_PACKAGE_DIRECTFB && !BR2_PACKAGE_XORG7
>>
> 
> I have no hard opinion on this, except that I do dislike possibly
> non-obvious use of select
> (and it has the dependency trouble you listed), which would leave GPM
> selected if one
> toggled links graphics on and off while using menuconfig.
> 
