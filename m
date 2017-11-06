From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 6 Nov 2017 13:33:21 -0800
Subject: [Buildroot] [PATCH] fs: add missing $$(sep) to pre- and
 post-command hooks code
In-Reply-To: <20171103220843.GD3387@scaer>
References: <20171103184953.32650-1-andrew.smirnov@gmail.com>
 <20171103220843.GD3387@scaer>
Message-ID: <CAHQ1cqHOgxKncX3RCGdfYtbRf2p_q7wTBCznVgBN0mSJp7bXUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 3, 2017 at 3:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Andrey, All,
>
> On 2017-11-03 11:49 -0700, Andrey Smirnov spake thusly:
>> When multiple hooks are registred, both pre-a and post-command hooks'
>> foreach loops need to have a separator at the end in order for the
>> code to work as intended. Without the separator all hooks end up as a
>> one single line command thus making all but the first hook into
>> no-ops.
>
> I had a hard time figuring out why they were ignored (and I was the one
> writing that). And it is pretty trivial: each hook is printed with
> PRINTF, which expands the hook in single quote, and there is no format
> string at all.
>
> So two hooks get expanded into (all on one line):
>     printf 'something expnded from first hook\n' print 'something else'
>
> and so on for the third and subsquent hooks. This should have been part
> of the commit message, I guess...
>
>> Fixes: 4628b6f3b4 ("fs: add pre- and post-command hooks")
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Cc: Romain Naour <romain.naour@gmail.com>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Yet, could you explain the use-case where you need other such hooks?
>

Can't say I necessarily have a use-case for it, but I was
experimenting with overriding certain aspects of
skeleton-init-systemd's behavior using custom hooks and realized that
none of them were working. Hence this patch.

Thanks,
Andrey Smirnov
