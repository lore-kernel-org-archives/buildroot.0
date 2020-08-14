From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 14 Aug 2020 14:00:27 +0200
Subject: [Buildroot] [PATCH] system: set default PATH according to
 BR2_ROOTFS_MERGED_USR
In-Reply-To: <20200813213802.GM13263@scaer>
References: <20200808155527.24726-1-paul@crapouillou.net>
 <20200813213802.GM13263@scaer>
Message-ID: <ROY1FQ.JZN208FBCKPR@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le jeu. 13 ao?t 2020 ? 23:38, Yann E. MORIN <yann.morin.1998@free.fr> 
a ?crit :
> Paul, All,
> 
> On 2020-08-08 17:55 +0200, Paul Cercueil spake thusly:
>>  Use "/usr/bin:/usr/sbin" as the default path if 
>> BR2_ROOTFS_MERGED_USR
>>  is enabled, otherwise use "/bin:/sbin:/usr/bin:/usr/sbin".
> 
> Why? Is it fixing an issue, or is it just for the beauty of it?

I got a PR to remove /bin:/sbin from the BR2_SYSTEM_DEFAULT_PATH in my 
tree, I thought it made more sense to do it this way.

Cheers,
-Paul

> However, see below...
> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   system/Config.in | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>>  diff --git a/system/Config.in b/system/Config.in
>>  index 5063797976..b8b7c16529 100644
>>  --- a/system/Config.in
>>  +++ b/system/Config.in
>>  @@ -402,7 +402,8 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
>> 
>>   config BR2_SYSTEM_DEFAULT_PATH
>>   	string "Set the system's default PATH"
>>  -	default "/bin:/sbin:/usr/bin:/usr/sbin"
> 
> This default is a bit unfortunate. Traditionally, distributions have a
> default set to /usr/sbin:/usr/bin:/sbin:/bin (i.e. exactly the reverse
> order that we have).
> 
> However, we have that to keep the behaviour prior to 375f7488758.
> 
>>  +	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
>>  +	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
> 
> I have no strong opinion, but I wonder why you had to do that...
> 
> Regards,
> Yann E. MORIN.
> 
>>   	help
>>   	  Sets the system's default PATH. It is being used in
>>   	  /etc/profile in the skeleton-init-common package and by some
>>  --
>>  2.28.0
>> 
>>  _______________________________________________
>>  buildroot mailing list
>>  buildroot at busybox.net
>>  http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___      
>          |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  
> There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   
> conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
