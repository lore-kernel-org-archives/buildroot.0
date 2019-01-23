From: Gervais, Francois <FGervais@distech-controls.com>
Date: Wed, 23 Jan 2019 13:51:55 +0000
Subject: [Buildroot] btrfs filesystem image as subvolume
In-Reply-To: <81138fbc-8766-a8dd-4420-8f8934d70733@codethink.co.uk>
References: <BL0PR0102MB3412448238EBCFA54C15B849F39F0@BL0PR0102MB3412.prod.exchangelabs.com>
 <878szbn2qx.fsf@dell.be.48ers.dk>,
 <81138fbc-8766-a8dd-4420-8f8934d70733@codethink.co.uk>
Message-ID: <BL0PR0102MB3412B01454EA6DB8E16F2D59F3990@BL0PR0102MB3412.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot for your input Robert,


Too bad, I didn't think about this superuser limitation. It would have been a really useful buildroot output.


In that case, I will give your script a try.


Thank you

________________________________
From: Robert Heywood <robert.heywood@codethink.co.uk>
Sent: January 23, 2019 4:44:42 AM
To: Peter Korsgaard; Gervais, Francois
Cc: buildroot at busybox.net
Subject: Re: btrfs filesystem image as subvolume

Hi all.

I wanted the same kind of functionality, but found that mkfs.btrfs doesn't
support much more than dumping the files into the root of the filesystem.
As a workaround, I made a script that mounts the filesystem, creates the
subvolume and uses btrfs-send to create the stream.

Sadly it requires root access, so it's not something that can be added to
buildroot. However, you're welcome to use the script if you want :)

https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_robjh_buildroot-2Ddev_blob_robjh-2Dtmpfiles_robjh_make-5Fbtrfs-5Fstream.sh&d=DwICaQ&c=tvvHx3uC0XdtgG-ImPDjfM0QnakIsmmGcwejQDVxD-g&r=G3HxHlWbpios6mQS7YUj_ICsYvxAzbjryvMxyUQ7Mso&m=RdpATESXfxVKQQJznVe_7qw6k-ANfDtCrwJT0MhIFsA&s=3V9oKBq7rxLqcrf3JIBDk22u4pP_IDTOFoffRmPieMw&e=

run it from your buildroot directory with sudo.
It'll produce ./output/images/os.btrfss, which you can use with btrfs-receive.

You might also want to look at this script, which uses the os.btrfss file to
create a btrfs filesystem on a flash drive, with my desired layout. and with
compression enabled;

https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_robjh_buildroot-2Ddev_blob_robjh-2Dtmpfiles_robjh_prep-5Fsd.sh&d=DwICaQ&c=tvvHx3uC0XdtgG-ImPDjfM0QnakIsmmGcwejQDVxD-g&r=G3HxHlWbpios6mQS7YUj_ICsYvxAzbjryvMxyUQ7Mso&m=RdpATESXfxVKQQJznVe_7qw6k-ANfDtCrwJT0MhIFsA&s=IZuvvxl42Wylzoav0LmUMJfs0aKv8VB5n1CV8b2Y600&e=

I hope this helps.

kind regards, rob.

On 23/01/2019 09:26, Peter Korsgaard wrote:
>>>>>> "Gervais," == Gervais, Francois <FGervais@distech-controls.com> writes:
>
> Hi,
>
>   > Hi,
>   > I tried the btrfs filesystem image and it works fine however in my
>   > use-case I'd like to have only the subvolume and not the whole btrfs
>   > filesystem.
>
>   > Basically the output of "btrfs send".
>
>   > I'd first like to make sure this is not possible today and discuss some
>   > high level guidelines you would like me to follow when I implement
>   > the feature.
>
>   > Should I add a sub-option to the "btrfs root filesystem" menu?
>   > Should if have it's own "Filesystem images" entry?
>
> Adding Robert who contributed the btrfs support. Robert, any feedback on
> this?
>

--
Robert Heywood, Codethink Ltd.
<blink>Privacy policy; https://urldefense.proofpoint.com/v2/url?u=https-3A__www.codethink.co.uk_privacy.html&d=DwICaQ&c=tvvHx3uC0XdtgG-ImPDjfM0QnakIsmmGcwejQDVxD-g&r=G3HxHlWbpios6mQS7YUj_ICsYvxAzbjryvMxyUQ7Mso&m=RdpATESXfxVKQQJznVe_7qw6k-ANfDtCrwJT0MhIFsA&s=-U9tssz2CxIl9yle9dhShM-tx-Zg8OEGzG77dUgcF1U&e=</blink>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190123/39dae9fc/attachment.html>
