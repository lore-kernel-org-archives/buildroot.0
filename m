From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 07 Nov 2014 14:31:17 +0100
Subject: [Buildroot] Creation of /etc/dropbear
In-Reply-To: <545B9ED3.7000802@zacarias.com.ar>
References: <545B9173.9080502@lucaceresoli.net>
 <CAAXf6LXOFHMjbFpEe5QF1v9KhfXtnzZUsPRs+Dy1kxy7mhcfWA@mail.gmail.com>
 <545B9ED3.7000802@zacarias.com.ar>
Message-ID: <545CC9A5.5070206@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gustavo,

thank you very much for your suggestions.

Gustavo Zacarias wrote:
 > On 11/06/2014 12:29 PM, Thomas De Schampheleire wrote:
>
>> In my case, the rootfs is also not persistent, but mounted read-write.
>> In this case, I have an init script that restores the keys from
>> persistent storage into /etc/dropbear and an exit script that saves
>> the keys to persistent storage. All this after checking that the keys
>> are valid using dropbearkey.
>>
>> If you could mount your roofs as read-write, then the same approach
>> could be taken, or alternatively the symlink could be created from an
>> init script.
>>
>> Of course, when mounting the rootfs truly read-only, neither approach works.

Theoretically the systems in object can be remounted read-only, but I
do not want that. The main issue is that the user can upgrade the entire
rootfs, completely overwriting the old one. Thus, if dropbear stored
the keys in the rootfs, they would be lost during a firmware upgrade and
would be regenerated at the next boot, but they would differ.

This is why I keep all user-modifiable settings in another filesystem,
that is not modificed during software upgrades.

>
> Overlayfs /etc, it won't matter if root is RO in that case.
> (alternatively aufs or other implementation as well).

This would theoretically work, but the kernel in these devices has no 
support for any union fs. I like them to be simple: more features, more
bugs, and I don't really want to add a non-trivial feature when I can
just add one line in dropbear.mk, with zero overhead for the target.

But do not despair because...

> Also you could bind-mount /etc/dropbear if it's a directory (which it is
> given what the package does) from some other rw directory of your choosing.

...this would really work, and it has negligible impact on the target.
Currently I'm using symlinks for this kind of stuff, but bind mounting
leads to the same result, as far as my needs are concerned.
Yes, this would be acceptable.

However I still would like to explore a solution in the build process,
not changing the target. This is not a target problem after all, and the
problem did not exits before [1] was committed in the 2014.08 cycle.

Another solutions in Buildroot that I thought of would be to add

   define DROPBEAR_REMOVE_ETC_DIR
           rm -fr $(TARGET_DIR)/etc/dropbear
   endef

   DROPBEAR_PRE_INSTALL_TARGET_HOOKS += DROPBEAR_REMOVE_ETC_DIR

in some .mk file in boards/<my_company>/ or packages/<my_company>/.
Absolutely dirty, but it does not touch package/dropbear/, thus it is
compatible with BR2_EXTERNAL.

One more solution would be adding a pre-build script, similar to the
post-build script but executed before building any package. This would
be non-trivial to implement, and overkill for solving my little need. I
wonder if a pre-build script might have more use cases that mine, which
might make it an interesting new feature.

[1] 
http://git.buildroot.net/buildroot/commit/package/dropbear?id=fe823b63741ba8eca70a534207d655f5affa927c

Regards,
-- 
Luca
