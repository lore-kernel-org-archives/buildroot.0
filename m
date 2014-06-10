From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 10 Jun 2014 18:42:31 +0200
Subject: [Buildroot] [RFCv1 2/4] pkg-generic: add step_pkg_size global
	instrumentation hook
In-Reply-To: <20140609220241.GK3512@free.fr>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140609220241.GK3512@free.fr>
Message-ID: <1513126.kpHDXik0HV@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tuesday 10 June 2014 00:02:41 Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-06-07 23:46 +0200, Thomas Petazzoni spake thusly:
> > This patch adds a global instrumentation hook that collects the list
> > of files installed in $(TARGET_DIR) by each package, and stores this
> > list into a file called $(BUILD_DIR)/<pkgname>.filelist. It can later
> > be used to determine the size contribution of each package to the
> > target root filesystem.
> > 
> > The only limitation is that if a file is installed by a package A, and
> > then overriden by a file from package B, the file will only be listed
> > in $(BUILD_DIR)/A.filelist as it is the first time we will see the
> > file.
> 
> If we really wanted to account for the realy package, we'd have to
> somehow notice that a pacakge did change the content of a file.
> 
> So, we would need to run sha1sum on all the files in the pre-step and
> the post step. Any differing line would mean a new file, or a changed
> file.
I did something similar in the past. I used inotify to follow modification 
done on TARGET_DIR. It was fast and detect overwritten files.

Stopping inotify process when build was interrupted was a little tricky, but 
results was corrects.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
