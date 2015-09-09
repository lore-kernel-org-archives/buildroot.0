From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 14:50:15 +0100
Subject: [Buildroot] [PATCHv5 1/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <20150909154617.4c91d847@free-electrons.com>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1441228505-23235-2-git-send-email-thomas.petazzoni@free-electrons.com>	<55F02FEC.7080703@imgtec.com>
 <20150909154617.4c91d847@free-electrons.com>
Message-ID: <55F03917.7080304@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Thomas Petazzoni,

On 09/09/2015 02:46 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 9 Sep 2015 14:11:08 +0100, Vicente Olivert Riera wrote:
> 
>>> +# This hook will be called before the target installation of a
>>> +# package. We store in a file named .br_filelist_before the list of
>>> +# files currently installed in the target. Note that the MD5 is also
>>> +# stored, in order to identify if the files are overwritten.
>>> +define step_pkg_size_start
>>> +	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>>
>> why only "-type f"? Packages can also install other type of files such
>> as links, for instance. Don't you want to track them as well?
> 
> It doesn't make sense to "md5sum" a symbolic link: what you will md5 is
> the target of the link, i.e another file of the file system that is
> already taken into account by the size statistics mechanism.
> 
> We are really only interested in calculating the size of the
> filesystem, so the only thing of interest are real file. We assume that
> the size of things like device files, directories or symbolic links is
> negligible and not relevant for our analysis.

Ok, I was looking at the packages-file-list.txt file as a way to know
which files are installed by each package (which is useful IMHO), and
then I noticed that packages like busybox only had a few files when it
actually installs lots of links. But, if this is only to calculate the
size of the file system, then it's fine.

Regards,

Vincent.

> Best regards,
> 
> Thomas
> 
