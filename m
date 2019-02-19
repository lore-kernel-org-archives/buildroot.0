From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 08:29:12 +0100
Subject: [Buildroot] [PATCH 2/2 v3] core/sdk: don't mangle symlinks with
 '.' or '..' at start
In-Reply-To: <b6f05f3a-d59a-7641-775e-ce06565ece73@mind.be> (Arnout
 Vandecappelle's message of "Wed, 6 Feb 2019 16:28:07 +0100")
References: <cover.1545491919.git.yann.morin.1998@free.fr>
 <235301274e7a921bb0b98aa606403b12fbee08be.1545491919.git.yann.morin.1998@free.fr>
 <b6f05f3a-d59a-7641-775e-ce06565ece73@mind.be>
Message-ID: <877edwb5iv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 > On 22/12/2018 16:18, Yann E. MORIN wrote:
 >> From: Joel Carlson <JoelsonCarl@gmail.com>
 >> 
 >> The current transform changes any '.' at the start of a filename to
 >> $(BR2_SDK_PREFIX). This also applies to the target of a symlink, when
 >> it is relative.
 >> 
 >> We thus might end up with something like:
 >> $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
 >> $(BR2_SDK_PREFIX)./opt/ext-toolchain/bin/aarch64-linux-gnu-ar
 >> 
 >> when it should be:
 >> $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
 >> ../opt/ext-toolchain/bin/aarch64-linux-gnu-ar
 >> 
 >> We fix that by making sure we always remove a known prefix, i.e. we
 >> remove the path to host dir. The obvious solution would be to cd into
 >> $(HOST_DIR)/.. , then tar ./host/ and finally use a --transfrom pattern
 >> as 's,^\./$(notdir $(HOST_DIR)),$(BR2_SDK_PREFIX)'.
 >> 
 >> Since $(HOST_DIR) can point to a user-supplied location, we don't know
 >> very well how the pattern may patch.
 >> 
 >> Instead, we cd into / and tar the full path to $(HOST_DIR).
 >> 
 >> Since tar removes any leading '/', it would spurr a warning message,
 >> which is annoying. So we explicitly remove the leading '/' from
 >> $(HOST_DIR) when we tar it.
 >> 
 >> Finally, we transform all filenames to replace a leading $(HOST_DIR)
 >> (without a leading /) to the prefix to use.
 >> 
 >> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
 >> [yann.morin.1998 at free.fr:
 >> - use a single transform pattern
 >> - use full HOST_DIR path as pattern to replace
 >> - update commit log accordingly
 >> ]
 >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
