From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jun 2016 21:36:21 +0200
Subject: [Buildroot] Resource Limits
In-Reply-To: <CAF_dkJC4Ds34F_BYcD=SfJAKhHvwspTAK0m_Y9y2Q7-p=T5nxA@mail.gmail.com>
References: <CAF_dkJCCZcXdf=G8TJ1HUA1TiCAmbE56oA6KkWMyxcLrkxgo-w@mail.gmail.com>
 <CAHXCMMLEuPHKHp5uwvxmzJMMwDg4HSVesDe7utRauYpgphzxcA@mail.gmail.com>
 <CAF_dkJC4Ds34F_BYcD=SfJAKhHvwspTAK0m_Y9y2Q7-p=T5nxA@mail.gmail.com>
Message-ID: <9dfae25a-4fe0-cf60-34e0-ae3eba5426fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-06-16 21:53, Patrick Doyle wrote:
> Hello Samuel,
> Thank you for your response.
> 
> I should have been a little more specific and given more details (so
> as to reveal more of my ignorance :-))...
> 
> I am not using a preempt-RT kernel, although that might be a
> possibility in the future.  I am using POSIX threads, with SCHED_FIFO
> and desire to set threads with priorities higher than zero.  This
> works perfectly fine when I run my multithreaded application as root.
> But I want to run my application as an unprivileged user.  Once I do
> that, I think I need some way to set RLIMIT_RTPRIO for my user
> application.  From what I have read, I can set that via PAM or via
> sysctl, or, perhaps via some other mechanism.
> 
> For my embedded application, I would prefer that the "via some other
> mechanism" be "compile the kernel such that user applications can set
> their priorities to be greater than zero".  I would prefer this
> because it has zero imprint upon the size of my severely
> size-constrained rootfs.

 The 'ulimit' shell builtin of busybox ash should have the -r option to set the
maximum real-time priority. So, from the init script that is starting your
application (and which runs as root), call ulimit -r 5 to set maximum RT
priority to 5.

 Alternatively, create a setuid wrapper that calls setrlimit() before dropping
privileges.

 Regards,
 Arnout

> 
> I guess I forgot to mention that I have a severly size-constrained
> rootfs and would prefer not to include PAM or sysctl unless I really
> needed to (or perhaps got it for nearly free in busybox).
> 
> That's the backstory behind my question.
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
