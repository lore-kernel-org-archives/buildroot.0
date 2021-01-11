From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Jan 2021 22:39:19 +0100
Subject: [Buildroot] BR2_PER_PACKAGE_DIRECTORIES : How to remove file
 installed from an other package
In-Reply-To: <D18CFEE6F046494E82855511759DF30ABCBDB79D@ikhexmbxc02n01.ikhex.ikoula.com>
References: <D18CFEE6F046494E82855511759DF30ABCBDB79D@ikhexmbxc02n01.ikhex.ikoula.com>
Message-ID: <6d462b25-3492-cced-78ce-545448ab834d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/01/2021 17:11, Fabien LEHOUSSEL wrote:
> Hello,
> 
> I am trying to remove files installed from a dependency package without success.
> 
> Before using  BR2_PER_PACKAGE_DIRECTORIES, I did like this :
> 
> PACKAGE2_CONF_DEPENDENCIES = package1
> 
> define PACKAGE2_INSTALL_TARGET_CMDS
>                 rm $(TARGET_DIR)/etc/init.d/XX
> endef
> 
> I have tried with hooks without success
> 
> What is the solution to make this work with BR2_PER_PACKAGE_DIRECTORIES ?

 Instead of doing it in the _INSTALL_TARGET_CMDS, you should do it as a
_TARGET_FINALIZE_HOOK. So:

define PACKAGE2_REMOVE_XX_INIT
	rm $(TARGET_DIR)/etc/init.d/XX
endef
PACKAGE2_TARGET_FINALIZE_HOOKS += PACKAGE2_REMOVE_XX_INIT


 Regards,
 Arnout

> 
> Thanks
> 
> Best Regards
> 
> Fabien
> 
> 
> Cordialement
> 
> Fabien Lehoussel
> ________________________________
> Fabien LEHOUSSEL / Chef de Projets
> M?diane Syst?me
> 54 Route de Sartrouville - 78232 Le Pecq Cedex
> 01.30.15.20.42 fabien.lehoussel at medianesysteme.com<mailto:fabien.lehoussel@medianesysteme.com>
> 
> [http://medianesysteme.com/images/Logos/Logo_HG.png]<https://www.medianesysteme.com/images/Logos/Logo_HG.png>
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
