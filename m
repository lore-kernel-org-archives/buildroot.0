From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 22 Jun 2021 11:57:42 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20210622113003.7cbf0136@windsurf>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-2-herve.codina@bootlin.com>
 <20210621213140.GA44262@scaer> <20210622094052.01c0a074@bootlin.com>
 <20210622113003.7cbf0136@windsurf>
Message-ID: <e866365b-6244-303a-62d7-1cb00fda8897@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/06/2021 11:30, Thomas Petazzoni wrote:
> On Tue, 22 Jun 2021 09:40:52 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
>>     Compared to the first version, this patch has an improved commit message and
>>     generates the md5sum snapshot using
>>       'find -L $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;'
> 
> But is this better ? Due to not cd-ing into the directory, you will
> have full absolute paths in the .md5 file, and adding LC_ALL=C is quite
> customary too. Ditto for using | xargs instead of -exec.

xargs will run only start one md5sum process if the command line size 
permits it, whereas "-exec md5sum {} ;" will start one md5sum per file.

An alternative is "-exec md5sum {} +", which is essentially xargs-like.
