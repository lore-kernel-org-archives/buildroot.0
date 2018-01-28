From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 28 Jan 2018 10:10:40 +0100
Subject: [Buildroot] post image blues (fakeroot and chown)
In-Reply-To: <8AE4BE7D9622DF41B76E1AD887AA1A47A52ED7C0@MARCM-SBS2011.marcmltd.local>
References: <8AE4BE7D9622DF41B76E1AD887AA1A47A52ED7C0@MARCM-SBS2011.marcmltd.local>
Message-ID: <62c3dc1f-a8d4-e020-b11c-08fe8fdcf3f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-01-18 16:52, Marc Murphy wrote:
> Hello All
> 
> I am in the final stages of getting the buildroot image output configured and having an issue.
> 
> I have a couple of folders that I am using as partitions on the target. The images are created using genimage in the post-image.sh script

 Do you use genimage to create a filesystem, or only to create a raw partition?
If you want genimage to create a filesystem, you'll need to run it under
fakeroot (i.e. in the BR2_ROOTFS_POST_FAKEROOT_SCRIPT) to get ownership and
permissions correct.

> before being included in the final complete image. But I have an issue with the folder permissions and trying to correct them before the image is built.
> 
> On a normal linux system I would of course perform a:
> # sudo chown -R 0:0 some_folder

 When the script runs under fakeroot, you can in fact use these commands
(without sudo). However, the result is "forgotten" as soon as fakeroot exits, so
you have to run the _entire_ script up to the generation of the filesystem under
a single fakeroot call. That's what BR2_ROOTFS_POST_FAKEROOT_SCRIPT does: the
scripts are run under the same fakeroot invocation that also generates the
filesystem.

 Alternatively, you can use fakeroot's -i and -s options to make the results
"persistent". But since Buildroot's invocation doesn't use them, it means you'll
have to create the filesystem yourself then.

> That would put the permissions in to the correct root user and group.
> 
> This can't be done in the post-image script as cannot use sudo as it requires intervention of entering password.
> 
> I have then been trying to use fakeroot and it simply refuses to persistently change the owner and group, ll will show creator when not logged in as fakeroot but root when logged in as fakeroot.
> 
> Is there any "standard" way to do this ?

 As Baruch mentioned, the standard way is BR2_ROOTFS_DEVICE_TABLE, but that only
works for files and directories that will end up in the Buildroot-generated rootfs.


 Hope this helps.

 Regards,
 Arnout

> 
> I have been trying with all kinds of ways even resorted to trying to use fakeroot and makedevs:
> fakeroot /home/Devel/buildroot-2017.02/output/host/usr/bin/makedevs -d $PWD/permissions $PWD/image_staging/
> 
> 
> Kind Regards
> 
> Marc
> 
> 
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
