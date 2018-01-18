From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 18 Jan 2018 10:46:06 +0100
Subject: [Buildroot] [PATCH v2] package/bash: add /bin/bash to
 /etc/shells
In-Reply-To: <8c2a6cb6-7993-b05f-144f-82986cf2b913@mind.be>
References: <1515859527-13567-1-git-send-email-romain.naour@smile.fr>
 <20180113161220.GG3226@scaer> <8c2a6cb6-7993-b05f-144f-82986cf2b913@mind.be>
Message-ID: <270ad24e-4fa1-95f3-026c-7c85edcf2223@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 18/01/2018 ? 00:53, Arnout Vandecappelle a ?crit?:
> 
> 
> On 13-01-18 17:12, Yann E. MORIN wrote:
>> Romain, All,
>>
>> On 2018-01-13 17:05 +0100, Romain Naour spake thusly:
>>> When bash is selected, /bin/bash is not added to /etc/shells
>>> (see man shells). So, login tools like dropbear reject the ssh
>>> connexions for users using bash as shell in /etc/passwd.
>>>
>>> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
>>>
>>> Reported-by: Jeremy Rosen <jeremy.rosen@smile.fr>
>>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  Really? The guy who wrote the script that checks that no two packages can touch
> the same file acks this change?

Which script ?

> 
> [snip]
>>> +	grep -qsE '^/bin/bash' $(TARGET_DIR)/etc/shells \
>>> +		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
> 
>  So this is a nice example of a package breaking top-level parallel build.

ok, I did not take into account the top-level parallel build...

> 
>  I guess the solution is to collect the shells in a make variable and create
> /etc/shells in a finalize hook. Or alternatively, do this in a finalize hook
> instead of target-install hook.

What do you think about something in the pkg-generic infra ?

A package like bash register the shell path using

BASH_REGISTER_SHELL = /bin/bash

And the pkg-generic infra will add a hook in TARGET_FINALIZE_HOOKS.

Yann suggested this while discussing about this series.
We hesitated to modify the infra just for less that 10 packages, so I've keep
the /etc/shells handling in each packages.

About the finalize hook, the manual say:
"They are seldom used, and your package probably do not need them."
It discourages users to use them.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
