From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 08:09:28 +0200
Subject: [Buildroot] [PATCH v2] <pkg>-rsync: support user custom cmds
In-Reply-To: <CAEvN+1hA4T0B_azTQMhpX=o-k2yac4fy7a7r4u=WyROYZrQU8w@mail.gmail.com>
References: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
 <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
 <20130728150334.6a8a862c@skate>
 <CAAXf6LXvJjA_Wxm=OMCBKYZKudveUj=J-fpU7SeXgCxoH3MQhA@mail.gmail.com>
 <CAAXf6LWwD6fkDpANcYnKT+ShQoBPJKpjJm-1K70DYjs+5eWqEA@mail.gmail.com>
 <CAEvN+1iY-77EV8Ao9zNhm94H0JKbOQNv10iQRqMLMnot28PJAQ@mail.gmail.com>
 <CAAXf6LVDWo5RhPaH9DHGrmfwBuDGhs9G8W7p=XHKvsGeEM4OcQ@mail.gmail.com>
 <CAAXf6LVYEkcdUvf6+Whht0gX_XSQe1nNp_FPBg3g06diR9fPCQ@mail.gmail.com>
 <CAEvN+1hA4T0B_azTQMhpX=o-k2yac4fy7a7r4u=WyROYZrQU8w@mail.gmail.com>
Message-ID: <52145998.5090300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/13 20:14, Tzu-Jung Lee wrote:
> On Tue, Aug 20, 2013 at 11:08 PM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> On Wed, Aug 7, 2013 at 9:59 PM, Thomas De Schampheleire
>> <patrickdepinguin+buildroot@gmail.com> wrote:
>>> Hi all,
>>>
>>>>
>>>>>> Here are three suggestions:
>>>>>> - follow the proposed patch, keeping the default as it is and
>>>>>> providing a way to overrule it per package.
>>>>>> - simplifying the default exclusion list to .svn, .git, .hg and .bzr
>>>>>> (but this wouldn't cover the use case of Tzu-Jung Lee)
>>>>>> - make the exclusion list a global config option, defaulting to e.g.
>>>>>> .svn, .git, .hg, .bzr and maybe others, but changeable by the user.
>>>>>> - add a config option 'don't exclude version control files when rsyncing'
>>>>>> and don't provide further flexibility.
>>>>
>>>> I'm okay with the default setting being either exclusive or conservative.
>>>> As long as the HOOKS will be provided, and the default can be OVERRIDEN.
>>>> For example, if the default fetch step is reverted to 'cp -r', I can
>>>> still override it for
>>>> the large local projects to save the sync time.
>>>
>>> I don't think we should now consider the remote possibility of
>>> changing the default fetch step to something else. When ever that
>>> happens, we can discuss exceptions or hooks for that.
>>>
>>> Rather I think we should focus on the current situation which has some
>>> limitations. In my eyes, there are two independent selections:
>>> 1. does the user want rsync to copy binary files (like .o, .so etc.)
>>> 2. does the user want rsync to copy version control files (like .git,
>>> .svn, etc.)
>>>
>>> We could make things simple and allow no choice for 1 (always copy
>>> binary files).
>>> The second item could be a global config option, which is relatively
>>> simple and would cover most use cases IMO. It would not cover the case
>>> where package A does want version control files, and package B does
>>> not, I'm not sure if we need to consider this...
>>>
>>> What are the opinions of other buildroot contributors?
>>
>>
>> ping?
>
> If we don't allow any configurability, the default behavior must copy
> everything,
> since we don't know which files user would like to include or exclude,

  Agreed - *if* we don't allow configurability.


> If we're considering efficiency for some cases, especially those have giant VCS
> database such as linux kernel, I think the combination of the two
> patches proposed
> already simple enough. They don't really add that much of complexity, I think.
>
>   1. Support customized RSYNC (this patch)

  Like Thomas, I really don't see the point of being able to choose cp 
instead of rsync.


>   2. Allow each package add their post-rsync hook if they need.

  Adding the VCS stuff in a post-rsync-hook is really hackish.

  Instead, I think the rsync command should use $($(PKG)_RSYNC_OPTS), 
which allows the user to specify additional --include options in the 
override.mk file. The documentation of the override.mk file should also 
be updated to explain this possibility.


  Regards,
  Arnout

> We can change the default RSYNC command back to plain rsync. or 'cp'.
 >
> If an user is in favor of current behavior, which exclude VCS database,
> he can customize his RSYNC command to the one we are using now.
>
> And for those packages that do require VCS to be presented in the
> build directory,
> The 2nd patch allows it to add a post-rsync-hook, which 'link' the VCS directory
> from the source dir to the build dir.
>
>
> Roy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
