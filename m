From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jun 2014 18:58:40 +0200
Subject: [Buildroot] [RFCv1 2/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <3156840.4l9buZIenR@sagittea>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140609220241.GK3512@free.fr> <3156840.4l9buZIenR@sagittea>
Message-ID: <20140610165840.GB3561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-06-10 18:20 +0200, J?r?me Pouiller spake thusly:
> On Tuesday 10 June 2014 00:02:41 Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2014-06-07 23:46 +0200, Thomas Petazzoni spake thusly:
> > > This patch adds a global instrumentation hook that collects the list
> > > of files installed in $(TARGET_DIR) by each package, and stores this
> > > list into a file called $(BUILD_DIR)/<pkgname>.filelist. It can later
> > > be used to determine the size contribution of each package to the
> > > target root filesystem.
> > > 
> > > The only limitation is that if a file is installed by a package A, and
> > > then overriden by a file from package B, the file will only be listed
> > > in $(BUILD_DIR)/A.filelist as it is the first time we will see the
> > > file.
> > 
> > If we really wanted to account for the realy package, we'd have to
> > somehow notice that a pacakge did change the content of a file.
> > 
> > So, we would need to run sha1sum on all the files in the pre-step and
> > the post step. Any differing line would mean a new file, or a changed
> > file.
> I did something similar in the past. I used inotify to follow modification 
> done on TARGET_DIR. It was fast and detect overwritten files.

I've been playing with inotify too, and it is not really up to the task.
I was able to overload the "wait queue" very easily, and missed some
events (sometimes a lot of them), when the build was creating/changing a
lot of files in rapid-fire.

I was able to overcome the "wait-queue" limitation by increasing the
number of queueable events, but that requires root access, but not
everyone can be root on their machine (think shared build farms), and
the defaults are quite low.

> Handling build interruption was a little tricky, but results was corrects.

That's also an issue I see, and I don't think we want to go into too
complex a setting.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
