From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 2 Sep 2010 07:37:43 -0500
Subject: [Buildroot] [PATCH 4/8] Implement basic non-wget download
	methods
In-Reply-To: <1283422191-30926-5-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
	<1283422191-30926-5-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <201009020737.45906.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu September 2 2010, Maxime Petazzoni wrote:
> Packages can now be sourced from Git and Subversion repositories. The
> download method will be autodetected from the URI (git://, svn://, etc).
> If the repository is accessed through http(s), you can force the
> download method by setting a _SITE_METHOD variable to either 'git' or
> 'svn', respectively and without the quotes.
>

For the cases where the protocol scheme does not appear in the URI that
the user would input (such as private repository access via ssl) -

Will that _SITE_METHOD variable be able to override the autodetection?

Hmm...  In case any reader hasn't encountered this private repository access method. . . .

Both git and hg (Mercurial) can use ssl/ssh to identify users with access to a repository.
I do not know about svn, never studied or used it that much.
In the case of git, the following is the _only_ way to identify private users:
(Since git does not accept a ssh:// scheme in its command parse.)

The user, in their, ~/.ssh/config file, establishes an identity shortcut, similar to:

# Service user - access to private, access controlled repositories of user hgadm
host hguser
  user hgadm
  hostname hg.minimodding.com
  port 22
  IdentitiesOnly yes
  IdentityFile ~/.ssh/hg.minimod/hgusr_id_rsa

Where the entry for IdentityFile is the path and file name to the user's private key
that matches the user's remote public key on file with the repository access control system.

As usee by a person or by a script, the "hguser" appears instead of the scheme and authority 
fields of the URI.  
Hence, there is no scheme for a script to parse and control any "autodetect" process.

The GIT add-on package, Gitolite, does private repository authentication this way;
http://progit.org/book/ch4-8.html

The Mercurial access control package I am working on myself uses a similar authentication process.
Other private repository access controls will work in a similar manner due to the structure of
operation of remote ssh.

The reader can find additional information on private hg repository access, starting at:
http://hg.minimodding.com/repos/lua/luahg.hg/
Navigate to the /doc directory;
Select the example_install.pdf file;
Click "raw" in the listing header to grab the current pdf file in your pdf viewer;
See section 2.2.6 - Client Authority Shortcuts.

Sorry for the handsprings but the project isn't yet completed and published other than as above.

Mike
> The package's _VERSION variable defines which commit, revision, tag or
> branch should be checked out. For Git, it can be HEAD, a commit ID, a
> tag name or branch name (anything that can be checked out with `git
> checkout`). For Subversion, it must be a revision number, or HEAD.
> 
> Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
