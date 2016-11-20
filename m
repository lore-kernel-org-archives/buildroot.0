From: Cam Hutchison <camh@xdna.net>
Date: Sun, 20 Nov 2016 19:40:09 +1100
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
 with old distros
In-Reply-To: <5831322ee6fea_72b63f84f6441d9856270@ultri3.mail>
References: <564d.5830d7d7.de49@xdna.net>
 <5831322ee6fea_72b63f84f6441d9856270@ultri3.mail>
Message-ID: <CABa6e=pVPPTJeH+nX5LOaDtVf8iiZni8qOt+iHcwhUHhCFKqyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the testing, Ricardo.

Noted about the workflow errors. I was just throwing this out for
comment right now. I can spin it properly if needed, but as you say -
also easily adjusted on commit.

One thing I wasn't sure about and forgot to comment on when I posted
was the invocation of uniq(1). I'm using some GNU options and I'm not
sure when they were added to GNU uniq and what version RHEL5 has.

Can you confirm that you can invoke without error:
$ uniq --skip-fields=1 --all-repeated

If not, the generate_dupes() function will need to be fixed.


On 20 November 2016 at 16:18, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Cam,
>
> Those first lines of the commit message should be placed after the line with
> '---', because 'git am' would automatically remove them.
> There is also a duplicated SoB.
> No need to resend because of these, it can be manually fixed when applying.
>
> I didn't review the code, I only tested it.
>
> On Sat, Nov 19, 2016 at 08:53 PM, Cam Hutchison wrote:
>
>> Hi Yann,
>>
>> Since eval is kind of icky, how about something like this patch instead?
>>
>>
>> Currently, the br2-external script uses bash-4's associative arrays.
>>
>> However, some oldish enterprise-class distros like RHEL5 still use
>> bash-3.1 which lacks associative arrays.
>>
>> Remove the arrays by reading the external.desc files as we generate the
>> output file.
>>
>> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>> Signed-off-by: "Cam Hutchison" <camh@xdna.net>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Cc: Max Filippov <jcmvbkbc@gmail.com>
>> Signed-off-by: Cam Hutchison <camh@xdna.net>
> Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> [Simple tests using CentOS 5, bash 3.2.25:
> 1. make defconfig (in-tree build configuration);
> 2. created 2 small br2-external with a package and a defconfig each and
>    successfully configured out-of-tree build with multiple br2-external
>    using both defconfigs and downloaded the sources of both packages.]
>
> Regards,
> Ricardo
