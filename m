From: Robert Heywood <robert.heywood@codethink.co.uk>
Date: Wed, 23 Jan 2019 09:44:42 +0000
Subject: [Buildroot] btrfs filesystem image as subvolume
In-Reply-To: <878szbn2qx.fsf@dell.be.48ers.dk>
References: <BL0PR0102MB3412448238EBCFA54C15B849F39F0@BL0PR0102MB3412.prod.exchangelabs.com>
 <878szbn2qx.fsf@dell.be.48ers.dk>
Message-ID: <81138fbc-8766-a8dd-4420-8f8934d70733@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

I wanted the same kind of functionality, but found that mkfs.btrfs doesn't 
support much more than dumping the files into the root of the filesystem.
As a workaround, I made a script that mounts the filesystem, creates the 
subvolume and uses btrfs-send to create the stream.

Sadly it requires root access, so it's not something that can be added to 
buildroot. However, you're welcome to use the script if you want :)

https://github.com/robjh/buildroot-dev/blob/robjh-tmpfiles/robjh/make_btrfs_stream.sh

run it from your buildroot directory with sudo.
It'll produce ./output/images/os.btrfss, which you can use with btrfs-receive.

You might also want to look at this script, which uses the os.btrfss file to 
create a btrfs filesystem on a flash drive, with my desired layout. and with 
compression enabled;

https://github.com/robjh/buildroot-dev/blob/robjh-tmpfiles/robjh/prep_sd.sh

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
<blink>Privacy policy; https://www.codethink.co.uk/privacy.html</blink>
