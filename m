From: Petr Kulhavy <brain@jikos.cz>
Date: Fri, 26 Jan 2018 16:26:01 +0100
Subject: [Buildroot] Dropbear remote login fails
In-Reply-To: <87fu6siv3z.fsf@dell.be.48ers.dk>
References: <0f79957c-e9fd-0b25-e19b-a93149eaffe0@jikos.cz>
 <87fu6siv3z.fsf@dell.be.48ers.dk>
Message-ID: <5c7c1231-2405-ba70-c6d3-f0b67187546a@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 26/01/18 14:54, Peter Korsgaard wrote:
>>>>>> "Petr" == Petr Kulhavy <brain@jikos.cz> writes:
>   > Hi,
>   > recently I upgraded my system to the latest version of
>   > buildroot. After that I noticed that I cannot any longer ssh on my
>   > device because the default shell /bin/sh for the root is not in
>   > /etc/shells.
>
>   > Shouldn't it be added there? Or have I misconfigured something?
>
> With 'upgraded' do you mean you are using git head and not
> E.G. 2017.11.2?
Yes, I'm using the head now.

>
> We recently had a patch changing this for bash:
>
> commit 4d279697afbf8fb295274784103be2b837113d5e
> Author: Romain Naour <romain.naour@smile.fr>
> Date:   Sat Jan 13 17:05:27 2018 +0100
>
>      package/bash: add /bin/bash to /etc/shells
>
>      When bash is selected, /bin/bash is not added to /etc/shells
>      (see man shells). So, login tools like dropbear reject the ssh
>      connexions for users using bash as shell in /etc/passwd.
>
>      buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
>
>      Reported-by: Jeremy Rosen <jeremy.rosen@smile.fr>
>      Signed-off-by: Romain Naour <romain.naour@smile.fr>
>      Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>      Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>      Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> This has the side effect of adding an /etc/shells file to your rootfs
> where we didn't use to have one (and libc falls back to /bin/sh +
> /bin/csh if /etc/shells doesn't exist), so if you have bash enabled then
> /bin/sh is no longer accepted.
Ah, that explains why it worked before! I do have bash enabled as well.

> There's a patch series pending in patchwork fixing this. It would be
> great if you could give it a test:
>
> http://patchwork.ozlabs.org/project/buildroot/list/?series=24357
I will give it a try.

Petr
