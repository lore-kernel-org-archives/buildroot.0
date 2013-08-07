From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 21:59:18 +0200
Subject: [Buildroot] [PATCH v2] <pkg>-rsync: support user custom cmds
In-Reply-To: <CAEvN+1iY-77EV8Ao9zNhm94H0JKbOQNv10iQRqMLMnot28PJAQ@mail.gmail.com>
References: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
 <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
 <20130728150334.6a8a862c@skate>
 <CAAXf6LXvJjA_Wxm=OMCBKYZKudveUj=J-fpU7SeXgCxoH3MQhA@mail.gmail.com>
 <CAAXf6LWwD6fkDpANcYnKT+ShQoBPJKpjJm-1K70DYjs+5eWqEA@mail.gmail.com>
 <CAEvN+1iY-77EV8Ao9zNhm94H0JKbOQNv10iQRqMLMnot28PJAQ@mail.gmail.com>
Message-ID: <CAAXf6LVDWo5RhPaH9DHGrmfwBuDGhs9G8W7p=XHKvsGeEM4OcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

>
>>> Here are three suggestions:
>>> - follow the proposed patch, keeping the default as it is and
>>> providing a way to overrule it per package.
>>> - simplifying the default exclusion list to .svn, .git, .hg and .bzr
>>> (but this wouldn't cover the use case of Tzu-Jung Lee)
>>> - make the exclusion list a global config option, defaulting to e.g.
>>> .svn, .git, .hg, .bzr and maybe others, but changeable by the user.
>>> - add a config option 'don't exclude version control files when rsyncing'
>>> and don't provide further flexibility.
>
> I'm okay with the default setting being either exclusive or conservative.
> As long as the HOOKS will be provided, and the default can be OVERRIDEN.
> For example, if the default fetch step is reverted to 'cp -r', I can
> still override it for
> the large local projects to save the sync time.

I don't think we should now consider the remote possibility of
changing the default fetch step to something else. When ever that
happens, we can discuss exceptions or hooks for that.

Rather I think we should focus on the current situation which has some
limitations. In my eyes, there are two independent selections:
1. does the user want rsync to copy binary files (like .o, .so etc.)
2. does the user want rsync to copy version control files (like .git,
.svn, etc.)

We could make things simple and allow no choice for 1 (always copy
binary files).
The second item could be a global config option, which is relatively
simple and would cover most use cases IMO. It would not cover the case
where package A does want version control files, and package B does
not, I'm not sure if we need to consider this...

What are the opinions of other buildroot contributors?

Thanks,
Thomas
