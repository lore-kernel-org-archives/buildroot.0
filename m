From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 26 Oct 2015 20:08:16 +1300
Subject: [Buildroot] [PATCH] syslog-ng: Link against librt
In-Reply-To: <CAFOYHZDmJrQ1BY703iLY6FDke-z3Dcjb8ojSRs_x7nGwf7PpOQ@mail.gmail.com>
References: <1445817733-12772-1-git-send-email-judge.packham@gmail.com>
 <20151026045411.654c6ba5@free-electrons.com>
 <CAFOYHZDmJrQ1BY703iLY6FDke-z3Dcjb8ojSRs_x7nGwf7PpOQ@mail.gmail.com>
Message-ID: <CAFOYHZD60ZAPoyeHzL9akgu8MR5pSYGh4MH9ROnUPwvgH0VMdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 26, 2015 at 7:53 PM, Chris Packham <judge.packham@gmail.com> wrote:
> Hi Thomas,
>
> On Mon, Oct 26, 2015 at 4:54 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Chris Packham,
>>
>> On Mon, 26 Oct 2015 13:02:13 +1300, Chris Packham wrote:
>>
>>> +# rabbit-mq needs -lrt
>>> +SYSLOG_NG_CONF_ENV = LIBS=-lrt
>>
>> While this works, I believe a better solution is to fix the
>> configure.ac. It already checks if nanosleep is in librt, and if so,
>> links against librt.
>>
>> It should the same for those functions, if the rabbitmq support is
>> enabled.
>
> Hmm. Syslog-ng distributes rabbitmq-c as a sub package. The looking at
> included rabbitmq-c sources and the upstream package[1] it is checking
> for clock_gettime which it thinks it should find in librt. But looking
> at the config.log[2] for rabbitmq-c it has decided that no library is
> required. Is there something unexpected about clock_gettime with
> uclibc?
>
> [1] - https://github.com/alanxz/rabbitmq-c/blob/master/configure.ac#L104
> [2] - http://autobuild.buildroot.net/results/a3d/a3dfdebd76d47df11a8e26a215bb88fbce8dc6f7/syslog-ng-3.7.1/modules/afamqp/rabbitmq-c/config.log
>

Digging a bit deeper it looks like clock_gettime is in both libc and
librt. According to the (glibc) man page -lrt was needed prior to
glibc 2.17 so I'm guessing this is some kind of backwards
compatibility check that would happen to satisfy the posix_spawn
requirements. I'll see about an upstream patch to rabbitmq-c.

>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
