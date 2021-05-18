From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 22:23:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/environment-setup: Fix
 incorrect order of the `sed` expressions
In-Reply-To: <20210516141949.1271867-1-mgliga@bitdefender.com>
References: <20210516141949.1271867-1-mgliga@bitdefender.com>
Message-ID: <159f3b9b-f3d8-bed7-3dbb-b1c20a037c36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/05/2021 16:19, Mircea GLIGA wrote:
> Order of the `sed` expressions is important; when this was commited
> to master, the order of the expressions from the original patch [1] was
> changed, rendering the second expression to noop.
> 
> This made all the environment variables from the script to contain
> absolute paths: long absolute paths makes verbose builds difficult
> to read/follow.
> We can take advantage of the fact that the PATH is updated and we
> don't have to use absolute paths.
> 
> Fixed by reordering the `sed` expresions:
> * first update the path of the binaries: e.g. 's%$(HOST_DIR)/bin/%%g'
> * only then update remaining paths: e.g. 's%$(HOST_DIR)%\$$SDK_PATH%g'
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20201027140140.47982-1-matthew.weber at rockwellcollins.com/
> 
> Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>

 Applied to master (since this is fix), thanks.

 Thank you for the excellent commit message!

 Regards,
 Arnout

> ---
>  package/environment-setup/environment-setup.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index fcad013f0d..f4c52921f7 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -26,8 +26,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
>  	printf "alias cmake=\"cmake \
>  		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
>  		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
> -		-e 's%$(HOST_DIR)/bin/%%g' \
> +	$(SED) 's%$(HOST_DIR)/bin/%%g' \
> +		-e 's%$(HOST_DIR)%\$$SDK_PATH%g' \
>  		-e '/^export "PATH=/c\' \
>  		$(ENVIRONMENT_SETUP_FILE)
>  	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
> 
