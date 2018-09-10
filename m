From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2018 17:24:31 +0200
Subject: [Buildroot] [PATCH] support/mkusers: Preserve group members
In-Reply-To: <20180903131116.5404-1-johan.oudinet@gmail.com>
References: <20180903131116.5404-1-johan.oudinet@gmail.com>
Message-ID: <20180910152431.GC2674@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2018-09-03 15:11 +0200, Johan Oudinet spake thusly:
> When the function add_one_group is called on an existing group,
> make sure the members of this group are not removed in the process of
> deleting then re-adding the group.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[--SNIP--]
> +    members=$(get_members "$group")
>      # Remove any previous instance of this group, and re-add the new one
>      sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GROUP}"
> -    printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
> +    printf "%s:x:%d:%s\n" "${group}" "${gid}" "$members" >>"${GROUP}"

The variables should all be derefernced with accolades: $(members)

With that fixed when applying, my previous reviewed-by stands.

Regards,
Yann E. MORIN.

>  
>      # Ditto for /etc/gshadow if it exists
>      if [ -f "${GSHADOW}" ]; then
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
