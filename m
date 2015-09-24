From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Sep 2015 09:14:21 +0200
Subject: [Buildroot] [PATCHv2] dependencies.sh: improve the missing perl
 modules detection
In-Reply-To: <20150924040839.GB2229@tarshish>
References: <1443042786-28226-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150924040839.GB2229@tarshish>
Message-ID: <20150924091421.5b5956bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Sep 2015 07:08:40 +0300, Baruch Siach wrote:

> > +# Check that the Perl installation is complete enough for Buildroot.
> > +# Here is the space-separated list of the required modules:
> 
> The original comment implied that Data::Dumper is a dependency of 
> host-autoconf. I guess the same is true for Thread:Queue. This is useful 
> information that IMO should be preserved. Maybe some thing like the following:

Actually, the Thread::Queue module seems to be used by automake, not
autoconf. It's actually what I guessed from the bug report. And it
seems to indeed be the case:

thomas at skate:~/projets/buildroot (master)$ grep -r Queue output/build/host-autoconf-2.69/*
output/build/host-autoconf-2.69/lib/Autom4te/Channels.pm:  # Redirect all channels to push messages on a Thread::Queue using
output/build/host-autoconf-2.69/lib/Autom4te/Channels.pm:  # Output a message pending in a Thread::Queue.
thomas at skate:~/projets/buildroot (master)$ grep -r Queue output/build/host-automake-1.15/* 
output/build/host-automake-1.15/bin/automake.in:      require Thread::Queue;
output/build/host-automake-1.15/bin/automake.in:      import Thread::Queue;
output/build/host-automake-1.15/bin/automake.in:# Queue to push require_conf_file requirements to.
output/build/host-automake-1.15/bin/automake.in:  my $file_queue = Thread::Queue->new;
output/build/host-automake-1.15/bin/automake.in:      $msg_queues{$file} = Thread::Queue->new;
output/build/host-automake-1.15/bin/automake.in:  # Queue all makefiles.
output/build/host-automake-1.15/lib/Automake/Channels.pm:  # Redirect all channels to push messages on a Thread::Queue using
output/build/host-automake-1.15/lib/Automake/Channels.pm:  # Output a message pending in a Thread::Queue.
output/build/host-automake-1.15/old/ChangeLog.09:	Cope with absent Perl modules threads and Thread::Queue.
output/build/host-automake-1.15/old/ChangeLog.09:	Thread::Queue.
output/build/host-automake-1.15/old/ChangeLog.09:	Thread::Queue, and output messages from such a queue, suitably
output/build/host-automake-1.15/old/ChangeLog.09:	to set a Thread::Queue for channels, and to flush a queue.
output/build/host-automake-1.15/old/ChangeLog.09:	threading, then use `threads' and `Thread::Queue'.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
