From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Thu, 11 Feb 2016 15:02:15 -0200 (BRST)
Subject: [Buildroot] How do folks add packages to an existing rootfs
 during	development?
In-Reply-To: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
References: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
Message-ID: <2133459033.2222038.1455210135185.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Mensagem original -----
> De: "Patrick Doyle" <wpdster@gmail.com>
> Para: buildroot at busybox.net
> Enviadas: Quinta-feira, 11 de fevereiro de 2016 13:23:32
> Assunto: [Buildroot] How do folks add packages to an existing rootfs during	development?

> I have read section 10.7 "Why doesn't Buildroot generate binary
> packages (.deb, .ipkg...)?" in the Buildroot users manual, and I
> understand and appreciate the answer to that question.
> 
> My question is slightly different, and it is based on the following scenario:
> 
> I am creating a buildroot environment for my custom product.  I have
> generated the rootfs and deployed it to my development board.  Once I
> have done that, I have customized a few things to my liking (e.g.
> hostname, installed my custom application, generated OpenSSH keys,
> etc...).  Now I discover that I also want to add another package to my
> environment.
> 
> Option 1:
> Rerun "make menuconfig; make"; generate a new rootfs; flash it on my
> board; and redo the customizations.  (Most of the customizations will
> get easier with time, as I roll them into my configuration, but some
> of them, such as OpenSSH host keys, will just have to change each time
> I do this).
> 
> Option 2:
> Rerun "make menuconfig; make" and deploy just the new package.
> Lather, rinse, repeat, until I've figured out what package sets make
> the most sense.  Then do Option 1.
> 
> Which option do folks in this community choose in general?
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

If possible, try to export the root filesystem via NFS. For this, the card must download the kernel via tftp. If available, the dtb file must also be downloaded via tftp. Then:

cd your_output_folder
sudo mount --bind images/ your_tftp_folder (/var/lib/tftpboot ?)

no filesystem linked in kernel, check this on buildroot menuconfig

[ ] initial RAM filesystem linked into linux kernel (Not checked)

Install and setup nfs-kernel-server package, create directory to be exported
$ mkdir /work/my-nfsboot

Add the following line in /etc/exports
$ /work/my-nfsboot *(rw,insecure,async,no_subtree_check,no_root_squash)

Restart nfs-kernel-server 
$ sudo /etc/init.d/nfs-kernel-server restart

$ sudo tar -zxvf output/images/rootfs.tar.gz -C /work/my-nfsboot

Now it is time to go to your card and configure your bootloader to load the kernel and dtb from tftp, for instance, and mount the rootfs via NFS (from work/my-nfsboot)

Some steps are not strictly necessary, but overall this is the fastest solution.

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
