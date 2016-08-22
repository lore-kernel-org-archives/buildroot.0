From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 22 Aug 2016 11:03:58 +0200
Subject: [Buildroot] systemd-timesyncd doesn't start with default config
 and skeleton
In-Reply-To: <20160822085101.GA5779@free.fr>
References: <e487aac1-f199-42d0-1211-4add9c5718bf@gmail.com>
 <20160822085101.GA5779@free.fr>
Message-ID: <78aeaa18-9631-65df-dc9b-2ddb1ff16190@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,


great, thx, i overlooked that thread. I'll dedicate some time to review
that patchset as well, in the meantime i'll just add a a post-build script.

Thanks, regards
zgyarmati

On 2016-08-22 10:51, Yann E. MORIN wrote:
> Zoltan, All,
>
> On 2016-08-22 10:41 +0200, Zoltan Gyarmati spake thusly:
>> Dear All,
>> with version 2016.08-rc2, with the default systemd configuration the
>> systemd-timesyncd start fails with the error msg:
>>
>> buildroot systemd[115]: systemd-timesyncd.service: Failed at step
>> NAMESPACE spawning /lib/systemd/systemd-timesyncd: No such file or directory
>>
>>  It seems that the problem is that in the default rootfs skeleton the
>> /var/tmp dir is a symlink to /tmp, and in
>> /usr/lib/systemd/system/systemd-timesyncd.service the PrivateTmp
>> variable is set.
>> Either removing the PrivateTmp=yes or making /var/tmp a directory on its
>> own solves the issue. What solution would be preferable to fix this?
> The best solution is that I get to finish my skeleton-revamp series and
> get it merged( first was submitted on the lkist, second is WIP taking
> into account the comments that were made on the first):
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2
>
> Unfortunately, that won't be in 2016.08, as I haven't had time to finish
> it properly before rc1. So it will only go in for next cycle... :-/
>
> In the meantime, just use a post-build script that cleans up the mess,
> like tweaking the unit file to not require PrivateTmp, or to remove the
> /var/tmp symlink and make it a directory.
>
> Regards,
> Yann E. MORIN.
>


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160822/6d1161d5/attachment.asc>
